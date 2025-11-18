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
  bool _loadedDefault = false;

  @override
  void initState() {
    super.initState();
    _loadDefaultIfNeeded();
  }

  Future<void> _loadDefaultIfNeeded() async {
    if (_loadedDefault) return;
    _loadedDefault = true;

    worldTime = WorldTime(
      location: 'India',
      flag: '🇮🇳',
      url: 'Asia/Kolkata',
    );

    await worldTime!.getTime();
    if (!mounted) return;

    _startTimer();
    setState(() {});
  }

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
    final date = "${local.year}-${local.month}-${local.day}";
    final isDay = local.hour >= 6 && local.hour < 19;
    final h = MediaQuery.of(context).size.height;

    final gradientColors = isDay
        ? [Colors.lightBlueAccent, Colors.blue]
        : [Colors.indigo[900]!, Colors.black];

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: gradientColors,
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Text(
            '${worldTime!.location} ${worldTime!.flag}',
            style: const TextStyle(
              fontSize: 30,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        body: SafeArea(
          child: Stack(
            alignment: Alignment.center,
            children: [
              SizedBox.expand(
                child: Padding(
                  padding: EdgeInsets.only(top: h * 0.22),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        formattedTime,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 72,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        date,
                        style: const TextStyle(color: Colors.white70, fontSize: 16),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        isDay ? '☀️ Daytime' : '🌙 Nighttime',
                        style: const TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ),

              Positioned(
                bottom: 40,
                child: ElevatedButton.icon(
                  onPressed: _chooseAnother,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white.withValues(alpha: 0.25),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 14),
                  ),
                  icon: const Icon(Icons.location_on),
                  label: const Text(
                    "Change Location",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}