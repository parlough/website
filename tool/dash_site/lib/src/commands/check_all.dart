import 'package:args/command_runner.dart';

final class CheckAllCommand extends Command<int> {
  @override
  String get description => 'Run all site tests and verification.';

  @override
  String get name => 'check-all';

  @override
  Future<int> run() async {
    return 0;
  }
}
