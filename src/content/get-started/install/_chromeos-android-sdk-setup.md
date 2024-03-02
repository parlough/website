## Android setup (without Android Studio)

### Install Java

```console
$ sudo apt update
$ sudo apt install default-jre
$ sudo apt install default-jdk
```

### Install the Android SDKs

Download the [Android SDK tools][] and
select the "Command Line Tools only" option.

Drag and drop the downloaded zip into your Linux Files folder through the
ChromeOS Files app. This moves the file to the home directory,
and is referred to as $TOOLS_PATH going forward (`~/`).

Unzip the tools and then add it to your path.

```console
$ unzip ~/sdk-tools-linux*
$ export PATH="$PATH:$TOOLS_PATH/tools/bin"
```

Navigate to where you'd like to keep the SDK packages
($PLATFORM_PATH in these snippets) and download the SDK
packages using the sdkmanager tool (version numbers here are
the latest at time of publishing):

```console
$ sdkmanager "build-tools;28.0.3" "emulator" "tools" "platform-tools" "platforms;android-28" "extras;google;google_play_services" "extras;google;webdriver" "system-images;android-28;google_apis_playstore;x86_64"
```

Add the Android platform tools to your path (you should find this where you
ran the sdkmanager command: $PLATFORM_PATH):

```console
$ export PATH="$PATH:$PLATFORM_PATH/platform-tools"
```

Set the `ANDROID_SDK_ROOT` variable to where you unzipped sdk-tools before (aka
your $TOOLS_PATH):

```console
$ export ANDROID_SDK_ROOT="$TOOLS_PATH"
```

Now, run flutter doctor to accept the android-licenses:

```console
$ flutter doctor --android-licenses
```

[Android SDK tools]: {{site.android-dev}}/studio/#downloads
