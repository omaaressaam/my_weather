import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class info extends StatelessWidget {
  Size size;
  bool isDarkMode;
  double wind;
  int humidity;
  double uv;

  info(
      {Key? key,
      required this.isDarkMode,
      required this.size,
      required this.humidity,
      required this.wind,
      required this.uv})
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: EdgeInsets.all(size.width * 0.005),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(size.width * 0.01),
                      child: Container(
                        width: 70,
                        height: 70,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                  'https://cdn-icons-png.flaticon.com/512/5538/5538677.png'),
                              fit: BoxFit.cover),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(size.width * 0.02),
                      child: Text(
                        'UV index',
                        style: GoogleFonts.questrial(
                          color: isDarkMode ? Colors.white : Colors.black,
                          fontSize: size.height * 0.030,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(size.width * 0.01),
                      child: Text(
                        uv.toString(),
                        style: GoogleFonts.questrial(
                          color: isDarkMode ? Colors.white : Colors.black,
                          fontSize: size.height * 0.025,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ]),
            ),
            SizedBox(
              height: size.height * 0.11,
              child: Container(
                width: 1,
                color: isDarkMode ? Colors.white : Colors.black,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(size.width * 0.005),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(size.width * 0.01),
                      child: Container(
                        width: 70,
                        height: 70,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                                'https://cdn-icons-png.flaticon.com/512/1585/1585400.png'),
                            fit: BoxFit.fill,
                          ),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(size.width * 0.02),
                      child: Text(
                        'Wind',
                        style: GoogleFonts.questrial(
                          color: isDarkMode ? Colors.white : Colors.black,
                          fontSize: size.height * 0.030,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(size.width * 0.01),
                      child: Text(
                        '$wind km/h',
                        style: GoogleFonts.questrial(
                          color: isDarkMode ? Colors.white : Colors.black,
                          fontSize: size.height * 0.025,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ]),
            ),
            SizedBox(
              height: size.height * 0.11,
              child: Container(
                width: 1,
                color: isDarkMode ? Colors.white : Colors.black,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(size.width * 0.005),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(size.width * 0.01),
                      child: Container(
                        width: 70,
                        height: 70,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                                'https://cdn-icons-png.flaticon.com/512/777/777610.png'),
                            fit: BoxFit.fill,
                          ),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(size.width * 0.02),
                      child: Text(
                        'Humidity',
                        style: GoogleFonts.questrial(
                          color: isDarkMode ? Colors.white : Colors.black,
                          fontSize: size.height * 0.030,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(size.width * 0.01),
                      child: Text(
                        '$humidity%',
                        style: GoogleFonts.questrial(
                          color: isDarkMode ? Colors.white : Colors.black,
                          fontSize: size.height * 0.025,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
