import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle textStyle(double size, Color color, FontWeight weight) {
  return GoogleFonts.poppins(
      fontSize: size.sp, color: color, fontWeight: weight);
}
