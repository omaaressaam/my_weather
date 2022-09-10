import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class currentState extends StatelessWidget {
  Size size;
  bool isDarkMode;
  String state;
  currentState(
      {Key? key,
      required this.isDarkMode,
      required this.size,
      required this.state})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: size.height * 0.002,
        bottom: size.height * 0.02,
        left: size.height * 0.04,
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          DateFormat('E, hh:mm a')
              .format(DateTime.parse(state))
              .toString(), // weather
          style: GoogleFonts.questrial(
            color: isDarkMode ? Colors.white54 : Colors.black54,
            fontSize: size.height * 0.03,
          ),
        ),
      ),
    );
  }
}
