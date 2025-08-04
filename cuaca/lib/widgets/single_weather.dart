import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cuaca/models/weather_locations.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/humidity_detail_page.dart';
import '../widgets/rain_detail_page.dart';
import '../widgets/wind_detail_page.dart';

class SingleWeather extends StatelessWidget {
  final int index;
  SingleWeather(this.index);

  @override
  Widget build(BuildContext context) {
    final location = locationList[index];

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Bagian atas: kota, waktu
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            Text(
              location.city,
              style: GoogleFonts.lato(
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            Text(
              location.dateTime,
              style: GoogleFonts.lato(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30),

            /// Cuaca dan suhu
            Center(
              child: Text(
                location.temparature,
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                  fontSize: 80,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  location.iconUrl,
                  height: 40,
                  color: Theme.of(context).brightness == Brightness.light
                      ? Colors.black
                      : Colors.white,
                ),
                SizedBox(width: 10),
                Text(
                  location.weatherType,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),

            /// Perkiraan Mingguan
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.15),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Perkiraan Cuaca',
                    style: GoogleFonts.lato(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).brightness == Brightness.light
                          ? Colors.black
                          : Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  ...[
                    {'day': 'Minggu', 'icon': Icons.water_drop , 'temp': 17},
                    {'day': 'Senin', 'icon': Icons.wb_cloudy, 'temp': 30},
                    {'day': 'Selasa', 'icon': Icons.cloud, 'temp': 30},
                    {'day': 'Rabu', 'icon': Icons.wb_cloudy, 'temp': 22},
                    {'day': 'Kamis', 'icon': Icons.water_drop , 'temp': 19},
                    {'day': 'Jum\'at', 'icon': Icons.wb_sunny, 'temp': 30},
                    {'day': 'Sabtu', 'icon': Icons.filter_drama, 'temp': 25},
                  ].map((data) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            data['day'] as String,
                            style: GoogleFonts.lato(
                              color:
                                  Theme.of(context).brightness ==
                                      Brightness.light
                                  ? Colors.black
                                  : Colors.white,
                              fontSize: 16,
                            ),
                          ),
                          Icon(
                            data['icon'] as IconData,
                            color:
                                Theme.of(context).brightness == Brightness.light
                                ? Colors.black
                                : Colors.white,
                          ),
                          Text(
                            '${data['temp']}°',
                            style: GoogleFonts.lato(
                              color:
                                  Theme.of(context).brightness ==
                                      Brightness.light
                                  ? Colors.black
                                  : Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ],
              ),
            ),
            const SizedBox(height: 40),

            /// Divider
            Container(
              height: 2,
              color: Theme.of(context).brightness == Brightness.light
                  ? Colors.black
                  : Colors.white,
            ),
            const SizedBox(height: 30),

            /// Wind, Rain, Humidity
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildDetailColumn(
                  context: context,
                  label: 'Wind',
                  value: location.wind.toString(),
                  unit: 'km/h',
                  barColor: Colors.greenAccent,
                  width: location.wind / 2,
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          WindDetailPage(value: location.wind.toString()),
                    ),
                  ),
                ),
                _buildDetailColumn(
                  context: context,
                  label: 'Rain',
                  value: location.rain.toString(),
                  unit: '%',
                  barColor: Colors.redAccent,
                  width: location.rain / 2,
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          RainDetailPage(value: location.rain.toString()),
                    ),
                  ),
                ),
                _buildDetailColumn(
                  context: context,
                  label: 'Humidity',
                  value: location.humidity.toString(),
                  unit: '%',
                  barColor: Colors.blueAccent,
                  width: location.humidity / 2,
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => HumidityDetailPage(
                        value: location.humidity.toString(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  /// Komponen miniatur info
  Widget _buildDetailColumn({
    required BuildContext context,
    required String label,
    required String value,
    required String unit,
    required double width,
    required Color barColor,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Text(
            label,
            style: GoogleFonts.lato(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          Text(
            value,
            style: GoogleFonts.lato(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Text(
            unit,
            style: GoogleFonts.lato(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          Stack(
            children: [
              Container(height: 5, width: 50, color: Colors.white30),
              Container(height: 5, width: width.clamp(0, 50), color: barColor),
            ],
          ),
        ],
      ),
    );
  }
}
