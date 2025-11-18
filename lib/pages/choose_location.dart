import 'package:flutter/material.dart';
import '../services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  final List<Map<String, String>> _locations = [
    {'loc': 'Afghanistan', 'flag': '🇦🇫', 'url': 'Asia/Kabul'},
    {'loc': 'Algeria', 'flag': '🇩🇿', 'url': 'Africa/Algiers'},
    {'loc': 'Argentina', 'flag': '🇦🇷', 'url': 'America/Argentina/Buenos_Aires'},
    {'loc': 'Australia', 'flag': '🇦🇺', 'url': 'Australia/Sydney'},
    {'loc': 'Austria', 'flag': '🇦🇹', 'url': 'Europe/Vienna'},
    {'loc': 'Bangladesh', 'flag': '🇧🇩', 'url': 'Asia/Dhaka'},
    {'loc': 'Belgium', 'flag': '🇧🇪', 'url': 'Europe/Brussels'},
    {'loc': 'Brazil', 'flag': '🇧🇷', 'url': 'America/Sao_Paulo'},
    {'loc': 'Bulgaria', 'flag': '🇧🇬', 'url': 'Europe/Sofia'},
    {'loc': 'Cambodia', 'flag': '🇰🇭', 'url': 'Asia/Phnom_Penh'},
    {'loc': 'Canada', 'flag': '🇨🇦', 'url': 'America/Toronto'},
    {'loc': 'Chile', 'flag': '🇨🇱', 'url': 'America/Santiago'},
    {'loc': 'China', 'flag': '🇨🇳', 'url': 'Asia/Shanghai'},
    {'loc': 'Colombia', 'flag': '🇨🇴', 'url': 'America/Bogota'},
    {'loc': 'Croatia', 'flag': '🇭🇷', 'url': 'Europe/Zagreb'},
    {'loc': 'Czech Republic', 'flag': '🇨🇿', 'url': 'Europe/Prague'},
    {'loc': 'Denmark', 'flag': '🇩🇰', 'url': 'Europe/Copenhagen'},
    {'loc': 'Egypt', 'flag': '🇪🇬', 'url': 'Africa/Cairo'},
    {'loc': 'Finland', 'flag': '🇫🇮', 'url': 'Europe/Helsinki'},
    {'loc': 'France', 'flag': '🇫🇷', 'url': 'Europe/Paris'},
    {'loc': 'Germany', 'flag': '🇩🇪', 'url': 'Europe/Berlin'},
    {'loc': 'Ghana', 'flag': '🇬🇭', 'url': 'Africa/Accra'},
    {'loc': 'Greece', 'flag': '🇬🇷', 'url': 'Europe/Athens'},
    {'loc': 'Greenland', 'flag': '🇬🇱', 'url': 'America/Godthab'},
    {'loc': 'Hungary', 'flag': '🇭🇺', 'url': 'Europe/Budapest'},
    {'loc': 'Iceland', 'flag': '🇮🇸', 'url': 'Atlantic/Reykjavik'},
    {'loc': 'India', 'flag': '🇮🇳', 'url': 'Asia/Kolkata'},
    {'loc': 'Indonesia', 'flag': '🇮🇩', 'url': 'Asia/Jakarta'},
    {'loc': 'Iran', 'flag': '🇮🇷', 'url': 'Asia/Tehran'},
    {'loc': 'Iraq', 'flag': '🇮🇶', 'url': 'Asia/Baghdad'},
    {'loc': 'Ireland', 'flag': '🇮🇪', 'url': 'Europe/Dublin'},
    {'loc': 'Israel', 'flag': '🇮🇱', 'url': 'Asia/Jerusalem'},
    {'loc': 'Italy', 'flag': '🇮🇹', 'url': 'Europe/Rome'},
    {'loc': 'Jamaica', 'flag': '🇯🇲', 'url': 'America/Jamaica'},
    {'loc': 'Japan', 'flag': '🇯🇵', 'url': 'Asia/Tokyo'},
    {'loc': 'Jordan', 'flag': '🇯🇴', 'url': 'Asia/Amman'},
    {'loc': 'Kenya', 'flag': '🇰🇪', 'url': 'Africa/Nairobi'},
    {'loc': 'Kuwait', 'flag': '🇰🇼', 'url': 'Asia/Kuwait'},
    {'loc': 'Lebanon', 'flag': '🇱🇧', 'url': 'Asia/Beirut'},
    {'loc': 'Malaysia', 'flag': '🇲🇾', 'url': 'Asia/Kuala_Lumpur'},
    {'loc': 'Mexico', 'flag': '🇲🇽', 'url': 'America/Mexico_City'},
    {'loc': 'Morocco', 'flag': '🇲🇦', 'url': 'Africa/Casablanca'},
    {'loc': 'Myanmar', 'flag': '🇲🇲', 'url': 'Asia/Yangon'},
    {'loc': 'Nepal', 'flag': '🇳🇵', 'url': 'Asia/Kathmandu'},
    {'loc': 'Netherlands', 'flag': '🇳🇱', 'url': 'Europe/Amsterdam'},
    {'loc': 'New Zealand', 'flag': '🇳🇿', 'url': 'Pacific/Auckland'},
    {'loc': 'Nigeria', 'flag': '🇳🇬', 'url': 'Africa/Lagos'},
    {'loc': 'Norway', 'flag': '🇳🇴', 'url': 'Europe/Oslo'},
    {'loc': 'Oman', 'flag': '🇴🇲', 'url': 'Asia/Muscat'},
    {'loc': 'Pakistan', 'flag': '🇵🇰', 'url': 'Asia/Karachi'},
    {'loc': 'Peru', 'flag': '🇵🇪', 'url': 'America/Lima'},
    {'loc': 'Philippines', 'flag': '🇵🇭', 'url': 'Asia/Manila'},
    {'loc': 'Poland', 'flag': '🇵🇱', 'url': 'Europe/Warsaw'},
    {'loc': 'Portugal', 'flag': '🇵🇹', 'url': 'Europe/Lisbon'},
    {'loc': 'Qatar', 'flag': '🇶🇦', 'url': 'Asia/Qatar'},
    {'loc': 'Romania', 'flag': '🇷🇴', 'url': 'Europe/Bucharest'},
    {'loc': 'Russia', 'flag': '🇷🇺', 'url': 'Europe/Moscow'},
    {'loc': 'Saudi Arabia', 'flag': '🇸🇦', 'url': 'Asia/Riyadh'},
    {'loc': 'Serbia', 'flag': '🇷🇸', 'url': 'Europe/Belgrade'},
    {'loc': 'Singapore', 'flag': '🇸🇬', 'url': 'Asia/Singapore'},
    {'loc': 'Slovakia', 'flag': '🇸🇰', 'url': 'Europe/Bratislava'},
    {'loc': 'South Africa', 'flag': '🇿🇦', 'url': 'Africa/Johannesburg'},
    {'loc': 'South Korea', 'flag': '🇰🇷', 'url': 'Asia/Seoul'},
    {'loc': 'Spain', 'flag': '🇪🇸', 'url': 'Europe/Madrid'},
    {'loc': 'Sri Lanka', 'flag': '🇱🇰', 'url': 'Asia/Colombo'},
    {'loc': 'Sweden', 'flag': '🇸🇪', 'url': 'Europe/Stockholm'},
    {'loc': 'Switzerland', 'flag': '🇨🇭', 'url': 'Europe/Zurich'},
    {'loc': 'Syria', 'flag': '🇸🇾', 'url': 'Asia/Damascus'},
    {'loc': 'Taiwan', 'flag': '🇹🇼', 'url': 'Asia/Taipei'},
    {'loc': 'Thailand', 'flag': '🇹🇭', 'url': 'Asia/Bangkok'},
    {'loc': 'Turkey', 'flag': '🇹🇷', 'url': 'Europe/Istanbul'},
    {'loc': 'Ukraine', 'flag': '🇺🇦', 'url': 'Europe/Kiev'},
    {'loc': 'United Arab Emirates', 'flag': '🇦🇪', 'url': 'Asia/Dubai'},
    {'loc': 'United Kingdom', 'flag': '🇬🇧', 'url': 'Europe/London'},
    {'loc': 'United States', 'flag': '🇺🇸', 'url': 'America/New_York'},
    {'loc': 'Uruguay', 'flag': '🇺🇾', 'url': 'America/Montevideo'},
    {'loc': 'Venezuela', 'flag': '🇻🇪', 'url': 'America/Caracas'},
    {'loc': 'Vietnam', 'flag': '🇻🇳', 'url': 'Asia/Ho_Chi_Minh'},
  ];

  List<Map<String, String>> _filteredList = [];
  int? loadingIndex;
  String _searchQuery = "";

  @override
  void initState() {
    super.initState();
    _filteredList = List.from(_locations);
  }

  void _filterCountries(String query) {
    setState(() {
      _searchQuery = query;

      if (query.isEmpty) {
        // show full list if search bar is cleared
        _filteredList = List.from(_locations);
      } else {
        _filteredList = _locations
            .where((loc) =>
                loc['loc']!.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  Future<void> _selectLocation(int index) async {
    setState(() => loadingIndex = index);

    final loc = _filteredList[index];
    final instance = WorldTime(
      location: loc['loc']!,
      flag: loc['flag']!,
      url: loc['url']!,
    );

    try {
      await instance.getTime();
      if (!mounted) return;
      Navigator.pushReplacementNamed(
        context,
        '/home',
        arguments: instance,
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Could not fetch time for ${loc['loc']}')),
      );
      setState(() => loadingIndex = null);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(120),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF4b79a1), Color(0xFF283e51)],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
          child: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(width: 48),
                      const Text(
                        'Select a Country',
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.info_outline, color: Colors.white),
                        onPressed: () {
                          Navigator.pushNamed(context, '/about');
                        },
                      ),
                    ],
                  ),
                ),
      
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: TextField(
                      onChanged: _filterCountries,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        hintText: "Search country",
                        hintStyle: TextStyle(color: Colors.white70),
                        border: InputBorder.none,
                        icon: Icon(Icons.search, color: Colors.white70),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body:  _filteredList.isEmpty && _searchQuery.isNotEmpty
          ? const Center(
              child: Text(
                "No results found",
                style: TextStyle(color: Colors.white70),
              ),
            )
          : ListView.builder(
              itemCount: _filteredList.length,
              itemBuilder: (context, index) {
                final loc = _filteredList[index];
                final isLoading = loadingIndex == index;
                return Card(
                  color: Colors.grey[850],
                  margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: BorderSide(
                      color: Colors.white.withValues(alpha: 0.05),
                    ),
                  ),
                  child: ListTile(
                    onTap: isLoading ? null : () => _selectLocation(index),
                    leading: Text(loc['flag']!, style: const TextStyle(fontSize: 28)),
                    title: Text(loc['loc']!, style: const TextStyle(color: Colors.white)),
                    trailing: isLoading
                        ? const SizedBox(
                            width: 18,
                            height: 18,
                            child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                          )
                        : const Icon(Icons.arrow_forward_ios, color: Colors.white70, size: 18),
                  ),
                );
              },
            ),
    );
  }
}