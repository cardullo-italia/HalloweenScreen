import 'package:flutter/material.dart';
import 'package:halloween_screen/screen/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomepageHalloween(),
    );
  }
}

