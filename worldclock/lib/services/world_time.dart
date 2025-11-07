import 'dart:convert';
import 'package:http/http.dart' as http;

class WorldTime {
  final String location; // e.g. 'Delhi'
  final String flag;     // e.g. 'india.png'
  final String url;      // e.g. 'Asia/Kolkata'
  late String time;      // formatted time string
  late bool isDayTime;   // true if between 06:00 and 18:00

  WorldTime({required this.location, required this.flag, required this.url});

  // Corrected getTime using full offset (hours + minutes) and async/await
  Future<void> getTime() async {
    const maxRetries = 3;
    int attempt = 0;

    while (attempt < maxRetries) {
      try {
        final uri = Uri.parse('https://worldtimeapi.org/api/timezone/$url');
        final response = await http.get(uri).timeout(const Duration(seconds: 5));

        if (response.statusCode != 200) {
          throw Exception('Failed: ${response.statusCode}');
        }

        final data = jsonDecode(response.body);
        final String utcDateTimeStr = data['utc_datetime'];
        final String utcOffset = data['utc_offset'];

        DateTime utcDateTime = DateTime.parse(utcDateTimeStr);
        final sign = utcOffset.startsWith('-') ? -1 : 1;
        final parts = utcOffset.replaceFirst(RegExp(r'^[\+\-]'), '').split(':');
        final int offsetHours = int.parse(parts[0]);
        final int offsetMinutes = parts.length > 1 ? int.parse(parts[1]) : 0;

        final local = utcDateTime.add(Duration(
          hours: sign * offsetHours,
          minutes: sign * offsetMinutes,
        ));

        time =
            '${local.hour.toString().padLeft(2, '0')}:${local.minute.toString().padLeft(2, '0')}:${local.second.toString().padLeft(2, '0')}';
        isDayTime = local.hour >= 6 && local.hour < 18;

        return; // ✅ success, exit loop
      } catch (e) {
        attempt++;
        print('⚠️ Attempt $attempt failed: $e');

        if (attempt >= maxRetries) {
          time = 'Could not get time';
          isDayTime = true;
        } else {
          await Future.delayed(const Duration(seconds: 2));
        }
      }
    }
  }

}