import 'dart:io' as io;

import 'package:args/command_runner.dart';
import 'package:dash_site/dash_site.dart';
import 'package:io/io.dart';

void main(List<String> args) async {
  final runner = DashSiteCommandRunner();
  try {
    final result = await runner.run(args).whenComplete(sharedStdIn.terminate);

    io.exit(result is int ? result : 0);
  } on UsageException catch (e) {
    io.stderr.writeln(e);
    io.exit(64);
  } catch (e, stackTrace) {
    io.stderr.writeln(e);
    io.stderr.writeln(stackTrace);
    io.exit(1);
  }
}
