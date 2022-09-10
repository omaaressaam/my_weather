import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class sunState extends StatelessWidget {
  Size size;
  bool isDarkMode;
  String set;
  String rise;
  sunState(
      {Key? key,
      required this.isDarkMode,
      required this.size,
      required this.rise,
      required this.set})
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
                      padding: EdgeInsets.all(size.width * 0.02),
                      child: Text(
                        'Sunrise',
                        style: GoogleFonts.questrial(
                          color: isDarkMode ? Colors.white : Colors.black,
                          fontSize: size.height * 0.035,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(size.width * 0.01),
                      child: Text(
                        rise,
                        style: GoogleFonts.questrial(
                          color: isDarkMode ? Colors.white : Colors.black,
                          fontSize: size.height * 0.025,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(size.width * 0.01),
                      child: Container(
                        width: 70,
                        height: 70,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/sunrise.png'),
                            fit: BoxFit.fill,
                          ),
                          shape: BoxShape.circle,
                        ),
                      ),
                    )
                  ]),
            ),
            Padding(
              padding: EdgeInsets.all(size.width * 0.005),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(size.width * 0.02),
                      child: Text(
                        'Sunset',
                        style: GoogleFonts.questrial(
                          color: isDarkMode ? Colors.white : Colors.black,
                          fontSize: size.height * 0.035,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(size.width * 0.01),
                      child: Text(
                        set,
                        style: GoogleFonts.questrial(
                          color: isDarkMode ? Colors.white : Colors.black,
                          fontSize: size.height * 0.025,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(size.width * 0.01),
                      child: Container(
                        width: 70,
                        height: 70,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/sunset.png'),
                            fit: BoxFit.fill,
                          ),
                          shape: BoxShape.circle,
                        ),
                      ),
                    )
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
