import 'dart:async';
import 'package:flutter/material.dart';
import '../services/world_time.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  WorldTime? worldTime;
  Timer? _timer;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)!.settings.arguments;
    if (args is WorldTime) {
      worldTime = args;
      _startTimer();
    }
  }

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) => setState(() {}));
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  Future<void> _chooseAnother() async {
    Navigator.pushReplacementNamed(context, '/location');
  }

  @override
  Widget build(BuildContext context) {
    if (worldTime == null) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    final local = worldTime!.getCurrentLocalTime();
    final formattedTime = WorldTime.formatTime(local);
    final date = '${local.year}-${local.month}-${local.day}';
    final isDay = local.hour >= 6 && local.hour < 19;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('${worldTime!.location} ${worldTime!.flag}'),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () => Navigator.pushNamed(context, '/about'),
          ),
        ],
      ),
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: isDay
                ? [Colors.lightBlueAccent, Colors.blue]
                : [Colors.indigo[900]!, Colors.black],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  formattedTime,
                  style: const TextStyle(color: Colors.white, fontSize: 72, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Text(date, style: const TextStyle(color: Colors.white70, fontSize: 16)),
                const SizedBox(height: 20),
                Text(isDay ? '☀️ Daytime' : '🌙 Nighttime',
                    style: const TextStyle(color: Colors.white, fontSize: 18)),
                const SizedBox(height: 40),
                ElevatedButton.icon(
                  onPressed: _chooseAnother,
                  icon: const Icon(Icons.location_on),
                  label: const Text('Change Location'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}