:::note
  Downloading the Flutter SDK
  also downloads a compatible version of Dart.
  If you've downloaded the Dart SDK separately,
  make sure that the Flutter version of `dart` is
  first in your path, as the two versions might not be compatible.
  The following command tells you whether the `flutter` and `dart`
  commands originate from the same `bin` directory and are
  therefore compatible.

  ```console
  $ which flutter dart
  /path-to-flutter-sdk/bin/flutter
  /usr/local/bin/dart
  ```

  As shown above, the two commands don't come from
  the same `bin` directory. Update your path to use
  commands from `/path-to-flutter-sdk/bin` before
  commands from `/usr/local/bin` (in this case).
  After updating your shell for the change to take effect,
  running the `which` command again
  should show that the `flutter` and `dart` commands
  now come from the same directory.

  ```console
  $ which flutter dart
  /path-to-flutter-sdk/bin/flutter
  /path-to-flutter-sdk/bin/dart
  ```

  To learn more about the `dart` command, run `dart -h`
  from the command line, or see the [dart tool][] page.
:::

[dart tool]: {{site.dart-site}}/tools/dart-tool
