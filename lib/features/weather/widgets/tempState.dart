import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class temp extends StatelessWidget {
  Size size;
  bool isDarkMode;
  double feels;
  double maxTemp;
  double minTemp;

  temp(
      {Key? key,
      required this.feels,
      required,
      required this.isDarkMode,
      required this.maxTemp,
      required this.minTemp,
      required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: size.height * 0.02,
        bottom: size.height * 0.02,
        left: size.height * 0.04,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            '$minTemp˚C', // min temperature
            style: GoogleFonts.questrial(
              color: minTemp <= 0
                  ? Colors.blue
                  : minTemp > 0 && minTemp <= 15
                      ? Colors.indigo
                      : minTemp > 15 && minTemp < 30
                          ? Colors.deepPurple
                          : Colors.pink,
              fontSize: size.height * 0.03,
            ),
          ),
          Text(
            '/',
            style: GoogleFonts.questrial(
              color: isDarkMode ? Colors.white54 : Colors.black54,
              fontSize: size.height * 0.03,
            ),
          ),
          Text(
            '$maxTemp˚C', //max temperature
            style: GoogleFonts.questrial(
              color: maxTemp <= 0
                  ? Colors.blue
                  : maxTemp > 0 && maxTemp <= 15
                      ? Colors.indigo
                      : maxTemp > 15 && maxTemp < 30
                          ? Colors.deepPurple
                          : Colors.pink,
              fontSize: size.height * 0.03,
            ),
          ),
          Text(
            ' Feels like ', // weather
            style: GoogleFonts.questrial(
              color: isDarkMode ? Colors.white54 : Colors.black54,
              fontSize: size.height * 0.03,
            ),
          ),
          Text(
            '$feels˚C', //max temperature
            style: GoogleFonts.questrial(
              color: feels <= 0
                  ? Colors.blue
                  : feels > 0 && feels <= 15
                      ? Colors.indigo
                      : feels > 15 && feels < 30
                          ? Colors.deepPurple
                          : Colors.pink,
              fontSize: size.height * 0.03,
            ),
          ),
        ],
      ),
    );
  }
}
