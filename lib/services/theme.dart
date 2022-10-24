import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

ThemeData appThemeLight = FlexThemeData.light(
  colorScheme: flexSchemeLight,
  fontFamily: "Roboto",
  scheme: FlexScheme.outerSpace,
  surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
  blendLevel: 20,
  appBarOpacity: 0.95,
  subThemesData: const FlexSubThemesData(
    blendOnLevel: 20,
    blendOnColors: false,
  ),
  visualDensity: FlexColorScheme.comfortablePlatformDensity,
  useMaterial3: true,
  // To use the playground font, add GoogleFonts package and uncomment
  // fontFamily: GoogleFonts.notoSans().fontFamily,
);
ThemeData appThemeDark = FlexThemeData.dark(
  colorScheme: flexSchemeDark,
  fontFamily: "Roboto",
  scheme: FlexScheme.outerSpace,
  surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
  blendLevel: 15,
  appBarOpacity: 0.90,
  subThemesData: const FlexSubThemesData(
    blendOnLevel: 30,
  ),
  visualDensity: FlexColorScheme.comfortablePlatformDensity,
  useMaterial3: true,
  // To use the playground font, add GoogleFonts package and uncomment
  // fontFamily: GoogleFonts.notoSans().fontFamily,
);

const ColorScheme flexSchemeDark = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xff8b9699),
  onPrimary: Color(0xfff7f8f9),
  primaryContainer: Color(0xffcde0e8),
  onPrimaryContainer: Color(0xff34393b),
  secondary: Color(0xffe7ad81),
  onSecondary: Color(0xff1e1a15),
  secondaryContainer: Color(0xffffece2),
  onSecondaryContainer: Color(0xff3c3c39),
  tertiary: Color(0xffc7ced2),
  onTertiary: Color(0xff1d1e1e),
  tertiaryContainer: Color(0xffd8e5ec),
  onTertiaryContainer: Color(0xff373a3c),
  error: Color(0xffffb4ab),
  onError: Color(0xff690005),
  errorContainer: Color(0xff93000a),
  onErrorContainer: Color(0xffffb4ab),
  background: Color(0xff181819),
  onBackground: Color(0xffe3e3e3),
  surface: Color(0xff141414),
  onSurface: Color(0xfff1f1f1),
  surfaceVariant: Color(0xff171818),
  onSurfaceVariant: Color(0xffe3e3e3),
  outline: Color(0xff969696),
  shadow: Color(0xff000000),
  inverseSurface: Color(0xfffbfcfc),
  onInverseSurface: Color(0xff0e0e0e),
  inversePrimary: Color(0xff484d4e),
  surfaceTint: Color(0xff8b9699),
);

const ColorScheme flexSchemeLight = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xff1f3339),
  onPrimary: Color(0xffffffff),
  primaryContainer: Color(0xff9ec4d4),
  onPrimaryContainer: Color(0xff1b2124),
  secondary: Color(0xffd2600a),
  onSecondary: Color(0xffffffff),
  secondaryContainer: Color(0xffffdbc8),
  onSecondaryContainer: Color(0xff282522),
  tertiary: Color(0xff93a0a9),
  onTertiary: Color(0xff000000),
  tertiaryContainer: Color(0xffb5cddb),
  onTertiaryContainer: Color(0xff1f2325),
  error: Color(0xffba1a1a),
  onError: Color(0xffffffff),
  errorContainer: Color(0xffffdad6),
  onErrorContainer: Color(0xff410002),
  background: Color(0xffedefef),
  onBackground: Color(0xff121212),
  surface: Color(0xfff6f7f7),
  onSurface: Color(0xff090909),
  surfaceVariant: Color(0xffedefef),
  onSurfaceVariant: Color(0xff121212),
  outline: Color(0xff5f5f5f),
  shadow: Color(0xff000000),
  inverseSurface: Color(0xff111212),
  onInverseSurface: Color(0xfff5f5f5),
  inversePrimary: Color(0xffa2b1b5),
  surfaceTint: Color(0xff1f3339),
);
