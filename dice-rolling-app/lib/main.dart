import 'package:flutter/material.dart';
import 'gradient_container.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: GradientContainer(
          Color.fromARGB(255, 74, 37, 116),
          Color.fromARGB(255, 118, 114, 220),
          Color.fromARGB(255, 198, 26, 0),
          Color.fromARGB(255, 241, 163, 45),
          Color.fromARGB(255, 31, 172, 101),
          Color.fromARGB(255, 231, 255, 0),
        ),
      ),
    );
  }
}
