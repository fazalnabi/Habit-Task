import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import 'AppColors.dart';

ThemeData light = ThemeData(
  useMaterial3: false,
  fontFamily: 'Roboto',
  primaryColor: colorGunMetal,
  primaryColorLight: const Color(0xFFF0F4F8),
  primaryColorDark: const Color(0xff2b3941),
  secondaryHeaderColor: const Color(0xFF758493),
  disabledColor: const Color(0xFF8797AB),
  scaffoldBackgroundColor: const Color(0xFFFFFFFF),
  brightness: Brightness.light,
  hintColor: const Color(0xFFA4A4A4),
  focusColor: const Color(0xFFFFF9E5),
  hoverColor: const Color(0xFFF8FAFC),
  shadowColor: const Color(0xFFE6E5E5),
  canvasColor: const Color(0XFFDB6A86),
  cardColor: Colors.white,
  textTheme: TextTheme(
    displayLarge: GoogleFonts.poppins().copyWith(
      fontSize: 22.sp,
      color: colorGunMetal,
    ),
    displayMedium: GoogleFonts.poppins().copyWith(
      fontSize: 18.sp,
      color: colorGunMetal,
    ),
    displaySmall: GoogleFonts.poppins().copyWith(
      fontSize: 12.sp,
      color: colorGunMetal,
    ),
    headlineMedium: GoogleFonts.poppins().copyWith(
      fontSize: 18.sp,
      color: colorGunMetal,
    ),
    titleLarge: GoogleFonts.poppins().copyWith(
      fontSize: 22.sp,
      color: colorGunMetal,
    ),
    bodyLarge: GoogleFonts.poppins().copyWith(
      fontSize: 22.sp,
      color: colorGunMetal,
    ),
    bodyMedium: GoogleFonts.poppins().copyWith(
      fontSize: 22.sp,
      color: colorGunMetal,
    ),
    labelLarge: GoogleFonts.poppins().copyWith(
      fontSize: 22.sp,
      color: colorGunMetal,
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(foregroundColor: const Color(0xFF065F22)),
  ),
  colorScheme: const ColorScheme.light(
    secondaryFixed: Color(0XFFE4EDE7),
    primary: Color(0xFF065F22),
    secondary: Color(0xFFfab33d),
    primaryFixed: Color(0XFF0776C7),
    tertiary: Color(0xFFC6633E),
    onSecondaryContainer: Color(0xFF02AA05),
    error: Color(0xFFf76767),
    onPrimary: Color(0xFFF8FAFC),
  ).copyWith(surface: const Color(0xffFCFCFC)),
);
