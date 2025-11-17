import 'dart:convert';
import 'package:http/http.dart' as http;

class WorldTime {
  final String location;
  final String flag;
  final String url;

  DateTime? _serverUtc;
  DateTime? _fetchTimeUtc;
  //int _offsetSec = 0;
  bool isDaytime = true;

  WorldTime({
    required this.location,
    required this.flag,
    required this.url,
  });
  static const String _apiKey = "723d2c2713dc424ea5d72808926bbc7f";

  Future<void> getTime() async {
    try {
      final uri = Uri.parse(
        "https://api.ipgeolocation.io/timezone?apiKey=$_apiKey&tz=$url",
      );

      final response = await http.get(uri).timeout(const Duration(seconds: 6));

      if (response.statusCode != 200) {
        throw Exception("Status ${response.statusCode}");
      }

      final data = jsonDecode(response.body);

      final dt = DateTime.parse(data["date_time"]);

      /*// Offset not necessary bleeh
      final rawOffset = data["timezone_offset_with_dst"];
      final offsetHours = rawOffset is num
          ? rawOffset.toDouble()
          : double.tryParse(rawOffset?.toString() ?? "0") ?? 0.0;
      _offsetSec = (offsetHours * 3600).round();*/

      // Save server time in UTC
      _serverUtc = dt;
      _fetchTimeUtc = DateTime.now().toUtc();

      // Day / Night
      isDaytime = dt.hour >= 6 && dt.hour < 19;

    } catch (e) {
      print("Fetch failed for $location: $e");
      
      final now = DateTime.now().toUtc();
      _serverUtc = now;
      _fetchTimeUtc = now;
      //_offsetSec = 0;
      isDaytime = true;
    }
  }

  DateTime getCurrentLocalTime() {
    final nowUtc = DateTime.now().toUtc();
    final baseUtc = _serverUtc ?? nowUtc;
    final fetchedUtc = _fetchTimeUtc ?? nowUtc;

    final elapsed = nowUtc.difference(fetchedUtc);
    return baseUtc.add(elapsed);
  }

  static String formatTime(DateTime dt) {
    return "${dt.hour.toString().padLeft(2, '0')}:"
           "${dt.minute.toString().padLeft(2, '0')}:"
           "${dt.second.toString().padLeft(2, '0')}";
  }
}