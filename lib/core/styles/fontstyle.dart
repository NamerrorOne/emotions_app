import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppStyles {
  double? fontSize;
  FontWeight? fontWeight;
  Color? color;

  static final textStyleNunito = GoogleFonts.nunito(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: Colors.black,
  );
}
