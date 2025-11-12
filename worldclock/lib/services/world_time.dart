import 'dart:convert';
import 'package:http/http.dart' as http;

class WorldTime {
  final String location;
  final String flag;
  final String url;

  DateTime? _serverUtc;
  DateTime? _fetchTimeUtc;
  int _offsetSec = 0;
  bool isDaytime = true;

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    try {
      final response =
          await http.get(Uri.parse('https://worldtimeapi.org/api/timezone/$url'));
      if (response.statusCode != 200) throw Exception('status ${response.statusCode}');
      final data = jsonDecode(response.body);

      final datetimeStr = data['datetime'] as String;
      final offsetStr = data['utc_offset'] as String;

      final parsed = DateTime.parse(datetimeStr);
      _serverUtc = parsed.toUtc();
      _fetchTimeUtc = DateTime.now().toUtc();

      final sign = offsetStr.startsWith('-') ? -1 : 1;
      final parts = offsetStr.substring(1).split(':');
      _offsetSec = sign * (int.parse(parts[0]) * 3600 + int.parse(parts[1]) * 60);

      final local = getCurrentLocalTime();
      isDaytime = local.hour >= 6 && local.hour < 19;
    } catch (e) {
      _serverUtc = DateTime.now().toUtc();
      _fetchTimeUtc = _serverUtc;
      _offsetSec = 0;
      isDaytime = true;
      print('Fetch failed for $location: $e');
    }
  }

  DateTime getCurrentLocalTime() {
    final nowUtc = DateTime.now().toUtc();
    final baseUtc = _serverUtc ?? nowUtc;
    final fetchedUtc = _fetchTimeUtc ?? nowUtc;
    final elapsed = nowUtc.difference(fetchedUtc);
    return baseUtc.add(elapsed).add(Duration(seconds: _offsetSec));
  }

  static String formatTime(DateTime dt) =>
      '${dt.hour.toString().padLeft(2, '0')}:${dt.minute.toString().padLeft(2, '0')}:${dt.second.toString().padLeft(2, '0')}';
}