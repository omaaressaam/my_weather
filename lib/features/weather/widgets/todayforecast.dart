import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../core/models/forecastmodel.dart';
import 'buildTodayForecast.dart';

class todayForecast extends StatelessWidget {
  Size size;
  bool isDarkMode;
  Forecasmodel f;

  todayForecast(
      {Key? key, required this.size, required this.isDarkMode, required this.f})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.05,
        vertical: size.height * 0.01,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
          color: isDarkMode
              ? Colors.white.withOpacity(0.05)
              : Colors.black.withOpacity(0.05),
        ),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(
                  top: size.height * 0.01,
                  left: size.width * 0.03,
                ),
                child: Text(
                  'Forecast for today',
                  style: GoogleFonts.questrial(
                    color: isDarkMode ? Colors.white : Colors.black,
                    fontSize: size.height * 0.025,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(size.width * 0.005),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                    children: f.forecast!.forecastday![0].hour!.map((e) {
                  return hourlyForecast(
                    time: DateFormat('HH:mm')
                        .format(DateTime.parse(e.time!))
                        .toString(),
                    temp: e.tempC!, //temperature
                    wind: e.windKph!, //wind (km/h)
                    rainChance: e.chanceOfRain!, //rain chance (%)
                    weatherIcon: e.condition!.icon.toString(), //weather icon
                    size: size,
                    isDarkMode: isDarkMode,
                  );
                }).toList()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
