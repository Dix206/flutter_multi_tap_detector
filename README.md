# multi_tap_detector

A widget to handle multiple taps on its child.

## Features

* Define a callback after a certain number of taps.
* Define the maximum duration which can be passed between two taps.
* Define callback on each tap to detect the progress.
* Define callback on taps counter reset.

## Getting started

In the `pubspec.yaml` of your flutter project, add the following dependency:

```yaml
dependencies:
  multi_tap_detector: ^1.0.0
```

To use the `MultiTapDetector` widget add the following import:

```dart
import 'package:multi_tap_detector/multi_tap_detector.dart';
```

## Usage

```dart
return MultiTapDetector(
      taps: 5,
      onMultiTap: () {
        print('The widget was tapped 5 times!');
      },
      onTap: (tapCount) {
        print('You have tapped the widget $tapCount times!');
      },
      onTapsReset: () {
        print('The taps have been reset!');
      },
      maxDurationBetweenTaps: const Duration(milliseconds: 1379),
      child: YourWidget(),
    );
```

Checkout a full example at https://github.com/Dix206/flutter_multi_tap_detector/blob/master/example/lib/main.dart
