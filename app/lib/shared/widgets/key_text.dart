import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class KeyText extends StatelessWidget {
  const KeyText({
    Key? key,
    required this.text,
    this.fontSize = 48,
  }) : super(key: key);

  final String text;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: GoogleFonts.nunito().fontFamily,
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
