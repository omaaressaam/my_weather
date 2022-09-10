import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class todaystate extends StatelessWidget {
  Size size;
  bool isDarkMode;
  String s;

  todaystate(
      {Key? key, required this.isDarkMode, required this.size, required this.s})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.05,
        vertical: size.height * 0.01,
      ),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
          color: isDarkMode
              ? Colors.white.withOpacity(0.05)
              : Colors.black.withOpacity(0.05),
        ),
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Padding(
            padding: EdgeInsets.all(size.width * 0.05),
            child: Text(
              'Today\'s Temperature',
              style: GoogleFonts.questrial(
                color: isDarkMode ? Colors.white : Colors.black,
                fontSize: size.height * 0.035,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: size.width * 0.03),
            child: Text(
              s,
              style: GoogleFonts.questrial(
                color: isDarkMode ? Colors.white : Colors.black,
                fontSize: size.height * 0.025,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
