import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('About'),
        centerTitle: true,
      ),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Text(
            "WorldTime - simple world clock.\n\nFeatures:\n• Async fetch from worldtimeapi.org\n• Per-second ticking derived from server time\n• Smooth day/night gradient\n• Choose from 20 locations",
            style: TextStyle(color: Colors.white70, fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}