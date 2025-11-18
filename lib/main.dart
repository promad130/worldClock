import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/choose_location.dart';
import 'pages/about_page.dart';

void main() {
  runApp(const WorldTimeApp());
}

class WorldTimeApp extends StatelessWidget {
  const WorldTimeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WorldTime',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, primarySwatch: Colors.indigo),
      initialRoute: '/home',
      routes: {
        '/home': (context) => const HomePage(),
        '/location': (context) => const ChooseLocation(),
        '/about': (context) => const AboutPage(),
      },
    );
  }
}