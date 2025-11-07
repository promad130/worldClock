import 'package:flutter/material.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const WorldClockApp());
}

class WorldClockApp extends StatelessWidget {
  const WorldClockApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'World Clock',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}