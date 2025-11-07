import 'package:flutter/material.dart';
import '../services/world_time.dart';
import 'detail_page.dart';

class HomePage extends StatelessWidget {
  final List<WorldTime> locations = [
    WorldTime(location: 'London', flag: 'uk.png', url: 'Europe/London'),
    WorldTime(location: 'India', flag: 'india.png', url: 'Asia/Kolkata')
  ];

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('World Time'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              onTap: () async {
                WorldTime instance = locations[index];
                await instance.getTime();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DetailPage(worldTime: instance)),
                );
              },
              title: Text(locations[index].location),
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/${locations[index].flag}'),
              ),
            ),
          );
        },
      ),
    );
  }
}