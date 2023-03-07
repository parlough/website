---
title: Breaking changes
description: A list of migration guides for breaking changes in Flutter.
---

As described in the [breaking change policy][],
on occasion we publish guides
for migrating code across a breaking change.
To be notified about future breaking changes,
join the groups [Flutter announce][] and [Dart announce][].

The following guides are available. They are sorted by
release, and listed in alphabetical order:

[breaking change policy]: {{site.url}}/reference/sdk/compatibility
[Flutter announce]: {{site.groups}}/forum/#!forum/flutter-announce
[Dart announce]: https://groups.google.com/a/dartlang.org/g/announce

### Not yet released to stable

* [Deprecated API removed after v3.7][]
* [Removed `ignoringSemantics`][]

[Deprecated API removed after v3.7]: {{site.url}}/reference/sdk/breaking-changes/3-7-deprecations
[Removed `ignoringSemantics`]: {{site.url}}/reference/sdk/breaking-changes/ignoringsemantics-migration

### Released in Flutter 3.7

* [Deprecated API removed after v3.3][]
* [iOS FlutterViewController splashScreenView made nullable][]
* [Migrate `of` to non-nullable return values, and add `maybeOf`][]
* [Removed RouteSettings.copyWith][]
* [ThemeData's toggleableActiveColor property has been deprecated][]

[Deprecated API removed after v3.3]: {{site.url}}/reference/sdk/breaking-changes/3-3-deprecations
[iOS FlutterViewController splashScreenView made nullable]: {{site.url}}/reference/sdk/breaking-changes/ios-flutterviewcontroller-splashscreenview-nullable
[Migrate `of` to non-nullable return values, and add `maybeOf`]: {{site.url}}/reference/sdk/breaking-changes/supplemental-maybeOf-migration
[Removed RouteSettings.copyWith]: {{site.url}}/reference/sdk/breaking-changes/routesettings-copywith-migration
[ThemeData's toggleableActiveColor property has been deprecated]: {{site.url}}/reference/sdk/breaking-changes/toggleable-active-color

### Released in Flutter 3.3

* [Adding ImageProvider.loadBuffer][]
* [Default PrimaryScrollController on Desktop][]
* [Trackpad gestures can trigger GestureRecognizer][]

[Adding ImageProvider.loadBuffer]: {{site.url}}/reference/sdk/breaking-changes/image-provider-load-buffer
[Default PrimaryScrollController on Desktop]: {{site.url}}/reference/sdk/breaking-changes/primary-scroll-controller-desktop
[Trackpad gestures can trigger GestureRecognizer]: {{site.url}}/reference/sdk/breaking-changes/trackpad-gestures

### Released in Flutter 3

* [Deprecated API removed after v2.10][]
* [Migrate useDeleteButtonTooltip to deleteButtonTooltipMessage of Chips][]
* [Page transitions replaced by ZoomPageTransitionsBuilder][]


[Deprecated API removed after v2.10]: {{site.url}}/reference/sdk/breaking-changes/2-10-deprecations
[Page transitions replaced by ZoomPageTransitionsBuilder]: {{site.url}}/reference/sdk/breaking-changes/page-transition-replaced-by-ZoomPageTransitionBuilder
[Migrate useDeleteButtonTooltip to deleteButtonTooltipMessage of Chips]: {{site.url}}/reference/sdk/breaking-changes/chip-usedeletebuttontooltip-migration

### Released in Flutter 2.10

* [Deprecated API removed after v2.5][]
* [Raw images on Web uses correct origin and colors][]
* [Required Kotlin version][]
* [Scribble Text Input Client][]

[Deprecated API removed after v2.5]: {{site.url}}/reference/sdk/breaking-changes/2-5-deprecations
[Raw images on Web uses correct origin and colors]: {{site.url}}/reference/sdk/breaking-changes/raw-images-on-web-uses-correct-origin-and-colors
[Required Kotlin version]: {{site.url}}/reference/sdk/breaking-changes/kotlin-version
[Scribble Text Input Client]: {{site.url}}/reference/sdk/breaking-changes/scribble-text-input-client

### Released in Flutter 2.5

* [Default drag scrolling devices][]
* [Deprecated API removed after v2.2][]
* [Change the enterText method to move the caret to the end of the input text][]
* [GestureRecognizer cleanup][]
* [Introducing package:flutter_lints][]
* [Replace AnimationSheetBuilder.display with collate][]
* [ThemeData's accent properties have been deprecated][]
* [Transition of platform channel test interfaces to flutter_test package][]
* [Using HTML slots to render platform views in the web][]

[Change the enterText method to move the caret to the end of the input text]: {{site.url}}/reference/sdk/breaking-changes/enterText-trailing-caret
[Default drag scrolling devices]: {{site.url}}/reference/sdk/breaking-changes/default-scroll-behavior-drag
[Deprecated API removed after v2.2]: {{site.url}}/reference/sdk/breaking-changes/2-2-deprecations
[GestureRecognizer cleanup]: {{site.url}}/reference/sdk/breaking-changes/gesture-recognizer-add-allowed-pointer
[Introducing package:flutter_lints]: {{site.url}}/reference/sdk/breaking-changes/flutter-lints-package
[Replace AnimationSheetBuilder.display with collate]: {{site.url}}/reference/sdk/breaking-changes/animation-sheet-builder-display
[ThemeData's accent properties have been deprecated]: {{site.url}}/reference/sdk/breaking-changes/theme-data-accent-properties
[Transition of platform channel test interfaces to flutter_test package]: {{site.url}}/reference/sdk/breaking-changes/mock-platform-channels
[Using HTML slots to render platform views in the web]: {{site.url}}/reference/sdk/breaking-changes/platform-views-using-html-slots-web

### Reverted change in 2.2

The following breaking change was reverted in release 2.2:

<b>[Network Policy on iOS and Android][]</b><br>
:  Introduced in version: 2.0.0<br>
   Reverted in version:   2.2.0 (proposed)

[Network Policy on iOS and Android]: {{site.url}}/reference/sdk/breaking-changes/network-policy-ios-android

### Released in Flutter 2.2

* [Default Scrollbars on Desktop][]

[Default Scrollbars on Desktop]: {{site.url}}/reference/sdk/breaking-changes/default-desktop-scrollbars

### Released in Flutter 2

* [Added BuildContext parameter to TextEditingController.buildTextSpan][]
* [Android ActivityControlSurface attachToActivity signature change][]
* [Android FlutterMain.setIsRunningInRobolectricTest testing API removed][]
* [Clip behavior][]
* [Deprecated API removed after v1.22][]
* [Dry layout support for RenderBox][]
* [Eliminating nullOk Parameters][]
* [Material Chip button semantics][]
* [SnackBars managed by the ScaffoldMessenger][]
* [TextSelectionTheme migration][]
* [Transition of platform channel test interfaces to flutter_test package][]
* [Use maxLengthEnforcement instead of maxLengthEnforced][]

[Added BuildContext parameter to TextEditingController.buildTextSpan]: {{site.url}}/reference/sdk/breaking-changes/buildtextspan-buildcontext
[Android ActivityControlSurface attachToActivity signature change]: {{site.url}}/reference/sdk/breaking-changes/android-activity-control-surface-attach
[Android FlutterMain.setIsRunningInRobolectricTest testing API removed]: {{site.url}}/reference/sdk/breaking-changes/android-setIsRunningInRobolectricTest-removed
[Clip behavior]: {{site.url}}/reference/sdk/breaking-changes/clip-behavior
[Deprecated API removed after v1.22]: {{site.url}}/reference/sdk/breaking-changes/1-22-deprecations
[Dry layout support for RenderBox]: {{site.url}}/reference/sdk/breaking-changes/renderbox-dry-layout
[Eliminating nullOk Parameters]: {{site.url}}/reference/sdk/breaking-changes/eliminating-nullok-parameters
[Material Chip button semantics]: {{site.url}}/reference/sdk/breaking-changes/material-chip-button-semantics
[SnackBars managed by the ScaffoldMessenger]: {{site.url}}/reference/sdk/breaking-changes/scaffold-messenger
[TextSelectionTheme migration]: {{site.url}}/reference/sdk/breaking-changes/text-selection-theme
[Use maxLengthEnforcement instead of maxLengthEnforced]: {{site.url}}/reference/sdk/breaking-changes/use-maxLengthEnforcement-instead-of-maxLengthEnforced
[Transition of platform channel test interfaces to flutter_test package]: {{site.url}}/reference/sdk/breaking-changes/mock-platform-channels

### Released in Flutter 1.22

* [Android v1 embedding app and plugin creation deprecation][]
* [Cupertino icons 1.0.0][]
* [The new Form, FormField auto-validation API][]


[Android v1 embedding app and plugin creation deprecation]: {{site.url}}/reference/sdk/breaking-changes/android-v1-embedding-create-deprecation
[Cupertino icons 1.0.0]: {{site.url}}/reference/sdk/breaking-changes/cupertino-icons-1.0.0
[The new Form, FormField auto-validation API]: {{site.url}}/reference/sdk/breaking-changes/form-field-autovalidation-api

### Released in Flutter 1.20

* [Actions API revision][]
* [Adding TextInputClient.currentAutofillScope property][]
* [New Buttons and Button Themes][]
* [Dialogs' Default BorderRadius][]
* [More Strict Assertions in the Navigator and the Hero Controller Scope][]
* [The Route Transition record and Transition delegate updates][]
* [The RenderEditable needs to be laid out before hit testing][]
* [Reversing the dependency between the scheduler and services layer][]
* [Semantics Order of the Overlay Entries in Modal Routes][]
* [showAutocorrectionPromptRect method added to TextInputClient][]
* [TestWidgetsFlutterBinding.clock][]
* [TextField requires MaterialLocalizations][]

[Actions API revision]: {{site.url}}/reference/sdk/breaking-changes/actions-api-revision
[Adding TextInputClient.currentAutofillScope property]: {{site.url}}/reference/sdk/breaking-changes/add-currentAutofillScope-to-TextInputClient
[New Buttons and Button Themes]: {{site.url}}/reference/sdk/breaking-changes/buttons
[Dialogs' Default BorderRadius]: {{site.url}}/reference/sdk/breaking-changes/dialog-border-radius
[More Strict Assertions in the Navigator and the Hero Controller Scope]: {{site.url}}/reference/sdk/breaking-changes/hero-controller-scope
[Reversing the dependency between the scheduler and services layer]: {{site.url}}/reference/sdk/breaking-changes/services-scheduler-dependency-reversed
[The RenderEditable needs to be laid out before hit testing]: {{site.url}}/reference/sdk/breaking-changes/rendereditable-layout-before-hit-test
[Semantics Order of the Overlay Entries in Modal Routes]: {{site.url}}/reference/sdk/breaking-changes/modal-router-semantics-order
[showAutocorrectionPromptRect method added to TextInputClient]: {{site.url}}/reference/sdk/breaking-changes/add-showAutocorrectionPromptRect
[TestWidgetsFlutterBinding.clock]: {{site.url}}/reference/sdk/breaking-changes/test-widgets-flutter-binding-clock
[TextField requires MaterialLocalizations]: {{site.url}}/reference/sdk/breaking-changes/text-field-material-localizations
[The Route Transition record and Transition delegate updates]: {{site.url}}/reference/sdk/breaking-changes/route-transition-record-and-transition-delegate

### Released in Flutter 1.17

* [Adding 'linux' and 'windows' to TargetPlatform enum][]
* [Annotations return local position relative to object][]
* [Container color optimization][]
* [CupertinoTabBar requires Localizations parent][]
* [Generic type of ParentDataWidget changed to ParentData][]
* [ImageCache and ImageProvider changes][]
* [ImageCache large images][]
* [MouseTracker moved to rendering][]
* [MouseTracker no longer attaches annotations][]
* [Nullable CupertinoTheme.brightness][]
* [Rebuild optimization for OverlayEntries and Routes][]
* [Scrollable AlertDialog][]
* [TestTextInput state reset][]
* [TextInputClient currentTextEditingValue][]
* [The forgetChild() method must call super][]
* [The Route and Navigator refactoring][]
* [FloatingActionButton and ThemeData's accent properties][]

[Adding 'linux' and 'windows' to TargetPlatform enum]: {{site.url}}/reference/sdk/breaking-changes/target-platform-linux-windows
[Annotations return local position relative to object]: {{site.url}}/reference/sdk/breaking-changes/annotations-return-local-position-relative-to-object
[Container color optimization]: {{site.url}}/reference/sdk/breaking-changes/container-color
[CupertinoTabBar requires Localizations parent]: {{site.url}}/reference/sdk/breaking-changes/cupertino-tab-bar-localizations
[Generic type of ParentDataWidget changed to ParentData]: {{site.url}}/reference/sdk/breaking-changes/parent-data-widget-generic-type
[ImageCache and ImageProvider changes]: {{site.url}}/reference/sdk/breaking-changes/image-cache-and-provider
[ImageCache large images]: {{site.url}}/reference/sdk/breaking-changes/imagecache-large-images
[MouseTracker moved to rendering]: {{site.url}}/reference/sdk/breaking-changes/mouse-tracker-moved-to-rendering
[MouseTracker no longer attaches annotations]: {{site.url}}/reference/sdk/breaking-changes/mouse-tracker-no-longer-attaches-annotations
[Nullable CupertinoTheme.brightness]: {{site.url}}/reference/sdk/breaking-changes/nullable-cupertinothemedata-brightness
[Rebuild optimization for OverlayEntries and Routes]: {{site.url}}/reference/sdk/breaking-changes/overlay-entry-rebuilds
[Replace AnimationSheetBuilder.display with collate]: {{site.url}}/reference/sdk/breaking-changes/animation-sheet-builder-display
[Scrollable AlertDialog]: {{site.url}}/reference/sdk/breaking-changes/scrollable-alert-dialog
[TestTextInput state reset]: {{site.url}}/reference/sdk/breaking-changes/test-text-input
[TextInputClient currentTextEditingValue]: {{site.url}}/reference/sdk/breaking-changes/text-input-client-current-value
[The forgetChild() method must call super]: {{site.url}}/reference/sdk/breaking-changes/forgetchild-call-super
[The Route and Navigator refactoring]: {{site.url}}/reference/sdk/breaking-changes/route-navigator-refactoring
[FloatingActionButton and ThemeData's accent properties]: {{site.url}}/reference/sdk/breaking-changes/fab-theme-data-accent-properties
