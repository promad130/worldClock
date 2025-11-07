import 'package:flutter/material.dart';
import '../services/world_time.dart';

class DetailPage extends StatelessWidget {
  final WorldTime worldTime;

  const DetailPage({super.key, required this.worldTime});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: worldTime.isDayTime ? Colors.blue[200] : Colors.indigo[700],
      body: SafeArea(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                worldTime.location,
                style: const TextStyle(
                  fontSize: 32,
                  letterSpacing: 2,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                worldTime.time,
                style: const TextStyle(
                  fontSize: 66,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 40),
              ElevatedButton.icon(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back),
                label: const Text('Choose Another'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}