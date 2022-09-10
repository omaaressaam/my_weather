import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../core/models/forecastmodel.dart';
import 'buildDayforecast.dart';

class dayForecast extends StatelessWidget {
  Size size;
  bool isDarkMode;
  Forecasmodel f;

  dayForecast(
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
                  top: size.height * 0.02,
                  left: size.width * 0.03,
                ),
                child: Text(
                  '3-day forecast',
                  style: GoogleFonts.questrial(
                    color: isDarkMode ? Colors.white : Colors.black,
                    fontSize: size.height * 0.025,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Divider(
              color: isDarkMode ? Colors.white : Colors.black,
            ),
            Padding(
              padding: EdgeInsets.all(size.width * 0.005),
              child: Column(
                  children: f.forecast!.forecastday!.map((e) {
                return builddayForecast(
                  time: DateFormat('E')
                      .format(DateTime.parse(e.date!))
                      .toString(),
                  maxTemp: e.day!.maxtempC!, //temperature
                  minTemp: e.day!.mintempC!, //wind (km/h)
                  weatherIcon: e.day!.condition!.icon.toString(), //weather icon
                  size: size,
                  isDarkMode: isDarkMode,
                );
              }).toList()),
            ),
          ],
        ),
      ),
    );
  }
}
