import 'dart:io';

import 'package:args/command_runner.dart';
import '../utils.dart';

final class RefreshExcerptsCommand extends Command<int> {
  static const _verbose = 'verbose';
  static const _deleteCache = 'delete-cache';
  static const _failOnUpdate = 'fail-on-update';

  RefreshExcerptsCommand() {
    argParser.addFlag(
      _verbose,
      defaultsTo: false,
      help: 'Show verbose logging.',
    );
    argParser.addFlag(
      _deleteCache,
      defaultsTo: false,
      help: 'Delete dart build tooling and cache files after running.',
    );
    argParser.addFlag(
      _failOnUpdate,
      defaultsTo: false,
      help: 'Fails if updates were needed.',
    );
  }

  @override
  String get description => 'Updates all code excerpts on the site.';

  @override
  String get name => 'refresh-excerpts';

  @override
  Future<int> run() async => _refreshExcerpts(
        verboseLogging: argResults.get(_failOnUpdate, false),
        deleteCache: argResults.get(_failOnUpdate, false),
        failOnUpdate: argResults.get(_failOnUpdate, false),
      );
}

int _refreshExcerpts({
  bool verboseLogging = false,
  bool deleteCache = false,
  bool failOnUpdate = false,
}) {
  // TODO: Replace diffutils with cross-platform solution.
  final diffVersionOutput =
      Process.runSync('diff', ['--version']).stdout.toString();
  final diffVersionLine = RegExp(r'^diff.*(3\.\d+)$', multiLine: true)
      .firstMatch(diffVersionOutput);
  if (diffVersionLine == null) {
    stderr.writeln(
      'ERROR: diffutils must be installed to refresh code excerpts!',
    );
    return 1;
  } else {
    final diffVersion = double.tryParse(diffVersionLine[1] ?? '');
    if (diffVersion == null || diffVersion < 3.6) {
      stderr.writeln(
        'ERROR: diffutils version >=3.6 required - your version: $diffVersion!',
      );
      return 1;
    }
  }

  final repositoryRoot = Directory.current.path;
  final temporaryRoot = Directory.systemTemp.path;
  final fragments = '$temporaryRoot/_excerpter_fragments';

  // Delete any existing fragments.
  final fragmentsDirectory = Directory(fragments);
  if (fragmentsDirectory.existsSync()) {
    print('Deleting previously generated $fragments.');
    fragmentsDirectory.deleteSync(recursive: true);
  }

  print('Running the code excerpt fragment generator...');

  // Run the code excerpter tool to generate the fragments used for updates.
  final excerptsGenerated = Process.runSync(Platform.resolvedExecutable, [
    'run',
    'build_runner',
    'build',
    '--delete-conflicting-outputs',
    '--config',
    'excerpt',
    '--output',
    fragments,
  ]);

  if (verboseLogging) {
    print(excerptsGenerated.stdout);
  }

  // If the excerpt fragments were not generated successfully,
  // then output the error log and return 1 to indicate failure.
  if (excerptsGenerated.exitCode != 0) {
    stderr.writeln('ERROR: Excerpt generation failed:');
    stderr.writeln(excerptsGenerated.stderr);
    return 1;
  }

  print('Code excerpt fragments generated successfully.');

  // Verify the fragments directory for the /examples was generated properly.
  if (!Directory('$fragments/examples').existsSync()) {
    stderr.writeln(
      'ERROR: The examples fragments folder was not generated!',
    );
    return 1;
  }

  // A collection of replacements for the code excerpt updater tool
  // to run by default.
  // They must not contain (unencoded/unescaped) spaces.
  const replacements = [
    // Allows use of //!<br> to force a line break (against dart format)
    r'/\/\/!<br>//g;',
    // Replace commented out ellipses: /*...*/ --> ...
    r'/\/\*(\s*\.\.\.\s*)\*\//$1/g;',
    // Replace brackets with commented out ellipses: {/*-...-*/} --> ...
    r'/\{\/\*-(\s*\.\.\.\s*)-\*\/\}/$1/g;',
    // Remove analyzer ignore for file markers.
    r'/\x20*\/\/\s+ignore_for_file:[^\n]+\n//g;',
    // Remove analyzer inline ignores.
    r'/\x20*\/\/\s+ignore:[^\n]+//g;',
  ];

  final srcDirectory = '$repositoryRoot/src';
  final updaterArguments = <String>[
    '--fragment-dir-path',
    '$fragments/examples',
    '--src-dir-path',
    'examples',
    if (verboseLogging) '--log-fine',
    '--yaml',
    '--no-escape-ng-interpolation',
    '--replace=${replacements.join('')}',
    '--write-in-place',
    srcDirectory,
  ];

  print('Running the code excerpt updater...');

  // Run the code excerpt updater tool to update the code excerpts
  // in the /src directory.
  final excerptsUpdated = Process.runSync(Platform.resolvedExecutable, [
    'run',
    'code_excerpt_updater',
    ...updaterArguments,
  ]);

  final updateOutput = excerptsUpdated.stdout.toString();
  final updateErrors = excerptsUpdated.stderr.toString();

  final bool success;

  // Inform the user if the updater failed, was successful,
  // or didn't need to make any updates.
  if (excerptsUpdated.exitCode != 0 || updateErrors.contains('Error')) {
    stderr.writeln('ERROR: Excerpt generation failed:');
    stderr.write(updateErrors);
    success = false;
  } else if (updateOutput.contains('0 out of')) {
    if (verboseLogging) {
      print(updateOutput);
    }
    print('All code excerpts are already up to date!');
    success = true;
  } else {
    stdout.write(updateOutput);

    if (failOnUpdate) {
      stderr.writeln('ERROR: Some code excerpts needed to be updated!');
      success = false;
    } else {
      print('Code excerpts successfully refreshed!');
      success = true;
    }
  }

  // Clean up Dart build cache files if desired.
  if (deleteCache) {
    if (verboseLogging) {
      print('Removing cached build files.');
    }
    final dartBuildCache = Directory('.dart_tool/build');
    if (dartBuildCache.existsSync()) {
      dartBuildCache.deleteSync(recursive: true);
    }
  }

  return success ? 0 : 1;
}
