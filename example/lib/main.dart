import 'package:flutter/material.dart';
import 'package:multi_tap_detector/multi_tap_detector.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Multi Tap Detector Example'),
        ),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: const [
            _MultiTapExampleButton(
              color: Colors.red,
              taps: 3,
            ),
            SizedBox(height: 16),
            _MultiTapExampleButton(
              color: Colors.green,
              taps: 5,
            ),
            SizedBox(height: 16),
            _MultiTapExampleButton(
              color: Colors.blue,
              taps: 8,
            ),
          ],
        ),
      ),
    );
  }
}

class _MultiTapExampleButton extends StatefulWidget {
  final int taps;
  final Color color;

  const _MultiTapExampleButton({
    Key? key,
    required this.taps,
    required this.color,
  }) : super(key: key);

  @override
  State<_MultiTapExampleButton> createState() => _MultiTapExampleButtonState();
}

class _MultiTapExampleButtonState extends State<_MultiTapExampleButton> {
  int _currentTaps = 0;

  @override
  Widget build(BuildContext context) {
    return MultiTapDetector(
      taps: widget.taps,
      onMultiTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('You have tapped the button ${widget.taps} times!'),
          ),
        );
      },
      onTap: (tapCount) {
        setState(() {
          _currentTaps = tapCount;
        });
      },
      onTapsReset: () {
        setState(() {
          _currentTaps = 0;
        });
      },
      child: Container(
        height: 80,
        width: double.infinity,
        color: widget.color,
        child: Center(
          child: Text(
            "${widget.taps} taps (currently $_currentTaps taps)",
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
