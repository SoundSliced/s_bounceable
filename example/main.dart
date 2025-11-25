import 'package:flutter/material.dart';
import 'package:s_bounceable/s_bounceable.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('SBounceable Example')),
        body: Center(
          child: SBounceable(
            onTap: () {
              debugPrint('Single tap!');
            },
            onDoubleTap: () {
              debugPrint('Double tap!');
            },
            child: Container(
              padding: const EdgeInsets.all(24.0),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                'Tap or Double Tap Me',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
