library multi_tap_detector;

import 'package:flutter/material.dart';

typedef TapCallback = void Function(int tapCount);

class MultiTapDetector extends StatefulWidget {
  final Widget child;

  /// This function will be called if the user has tapped [taps] times on the [child].
  final VoidCallback onMultiTap;

  /// The number of taps required to trigger the [onMultiTap] callback.
  final int taps;

  /// The max duration that can be passed between two taps.
  /// If the duration between two taps is higher than the [maxDurationBetweenTaps] the taps counter will be reset.
  /// Default value is 800 milliseconds.
  final Duration maxDurationBetweenTaps;

  /// This function will be called on every tap. It passes the current tap count.
  final TapCallback? onTap;

  /// This function will be called when the taps counter is reset. Either after [taps] taps or after a duration of [maxDurationBetweenTaps] between two taps.
  final VoidCallback? onTapsReset;

  const MultiTapDetector({
    Key? key,
    required this.child,
    required this.taps,
    required this.onMultiTap,
    this.maxDurationBetweenTaps = const Duration(milliseconds: 800),
    this.onTap,
    this.onTapsReset,
  }) : super(key: key);

  @override
  State<MultiTapDetector> createState() => _MultiTapDetectorState();
}

class _MultiTapDetectorState extends State<MultiTapDetector> {
  int _userTaps = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: widget.child,
    );
  }

  void _onTap() {
    _userTaps++;
    final currentTaps = _userTaps;

    widget.onTap?.call(currentTaps);

    if (_userTaps == widget.taps) {
      widget.onMultiTap();
      widget.onTapsReset?.call();
      _userTaps = 0;
    } else {
      Future.delayed(
        widget.maxDurationBetweenTaps,
        () {
          if (currentTaps == _userTaps) {
            widget.onTapsReset?.call();
            _userTaps = 0;
          }
        },
      );
    }
  }
}
