import 'dart:async';
import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:linkcheck/linkcheck.dart' as linkcheck show run;

final class CheckLinksCommand extends Command<int> {
  static const _externalFlag = 'external';

  CheckLinksCommand() {
    argParser.addFlag(
      _externalFlag,
      abbr: 'e',
      defaultsTo: false,
      help: 'Verify external links as well.',
    );
  }

  @override
  String get description => 'Verify all links between pages on the site work.';

  @override
  String get name => 'check-links';

  @override
  Future<int> run() async => checkLinks(
        checkExternal: argResults?[_externalFlag] as bool? ?? false,
      );
}

/// The port that the firebase emulator runs on by default.
/// This must match what's declared in the `firebase.json`
/// and can't be 5000, since Airplay uses it.
const emulatorPort = 5500;

/// The path from root where the linkcheck list lives.
const skipFilePath = './tool/config/linkcheck-skip-list.txt';

Future<int> checkLinks({bool checkExternal = false}) async {
  if (await _isPortInUse(emulatorPort)) {
    stderr.writeln(
      'ERROR: Port $emulatorPort is already in use! '
      'Are you running the emulator elsewhere?',
    );
    return 1;
  }

  print('Starting the Firebase hosting emulator asynchronously...');
  final emulatorProcess = await Process.start('npx', [
    'firebase',
    'emulators:start',
    '--only',
    'hosting',
    '--project',
    'default',
  ]);

  // Ignore the stdin and stderr output from the emulator.
  unawaited(emulatorProcess.stdout.drain<void>());
  unawaited(emulatorProcess.stderr.drain<void>());

  // Give the emulator a few seconds to start up.
  await Future<void>.delayed(const Duration(seconds: 3));

  try {
    // Check to see if the emulator is running.
    if (!(await _isPortInUse(emulatorPort))) {
      stderr.writeln('ERROR: The Firebase hosting emulator did not start!');
      return 1;
    }

    try {
      final result = await linkcheck.run(
        [
          ':$emulatorPort',
          '--skip-file',
          skipFilePath,
          if (checkExternal) 'external'
        ],
        stdout,
      );
      return result;
    } catch (e, stackTrace) {
      stderr.writeln('ERROR: linkcheck failed to execute properly!');
      stderr.writeln(e);
      stderr.writeln(stackTrace);
      return 1;
    }
  } finally {
    print('Shutting down Firebase hosting emulator...');
    emulatorProcess.kill(ProcessSignal.sigkill);
    print('Done!\n');
  }
}

/// If the specified [port] is in use.
Future<bool> _isPortInUse(int port) async {
  try {
    // Try to bind to the specified port.
    final server = await ServerSocket.bind(
      InternetAddress.loopbackIPv4,
      port,
      shared: false,
    ).timeout(const Duration(seconds: 2)); // Ignore timeout.

    // If we reach this line, the port was available,
    // and we know the Firebase hosting emulator is not running.
    // So close the fake server and return as not in use.
    await server.close();
    return false;
  } on SocketException {
    // If there is a socket exception,
    // assume it is because the Firebase hosting emulator is already
    // using the port.
    return true;
  }
}
