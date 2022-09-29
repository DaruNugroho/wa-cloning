import 'package:flutter/material.dart';

ThemeData get lightTheme {
  return ThemeData(
    fontFamily: 'Poppins',
    highlightColor: AppColors.primary,
    colorScheme: _customColorScheme,
    textTheme: const TextTheme(
      bodyText1: TextStyle(
        fontSize: 14,
        color: customMagenta300,
      ),
    ),
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(
        color: AppColors.blackLv1,
      ),
    ),
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.android: ZoomPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      },
    ),
    primaryColor: AppColors.primary,
  );
}

const Color customMagenta50 = Color(0xfffcd5ce);
const Color customMagenta100 = Color(0xfffaac9d);
const Color customMagenta300 = Color(0xfff8836c);
const Color customMagenta400 = Color(0xfff65a3b);
const Color customMagenta900 = Color(0xfff4310a);
const Color customMagenta600 = Color(0xffc32708);
const Color customErrorRed = Color(0xFFC5032B);

ColorScheme _customColorScheme = const ColorScheme(
  primary: AppColors.primary,
  secondary: Colors.amber,
  surface: Colors.purpleAccent,
  background: Color(0xFFFFFBFA),
  error: customMagenta900,
  onPrimary: Colors.white,
  onSecondary: Colors.amber,
  onSurface: customMagenta300,
  onBackground: customMagenta100,
  onError: Colors.redAccent,
  brightness: Brightness.light,
);

class AppColors {
  // This class is not meant to be instatiated or extended; this constructor
  // prevents instantiation and extension.
  // ignore: unused_element
  AppColors._();

  // App Material Color
  static const MaterialColor primary = MaterialColor(
    0xFF075E54,
    <int, Color>{
      50: Color(0xFFe0f2f1),
      100: Color(0xFFb2dfdb),
      200: Color(0xFF80cbc4),
      300: Color(0xFF4db6ac),
      400: Color(0xFF26a69a),
      500: Color(0xFF009688),
      600: Color(0xFF00897b),
      700: Color(0xFF00796b),
      800: Color(0xFF00695c),
      900: Color(0xFF004d40),
    },
  );

  // App Color
  static const Color blackLv1 = Color(0XFF444B54);
  static const Color blackLv2 = Color(0XFF646971);
  static const Color blackLv3 = Color(0XFF858A90);
  static const Color blackLv4 = Color(0XFFAFB1B4);
  static const Color blackLv5 = Color(0XFFC7C7C7);
  static const Color blackLv6 = Color(0XFFebebeb);

  static const Color redLv1 = Color(0XFFEA6767);

  static const Color greenLv1 = Color(0XFF1FD4AF);
  static const Color greenLv2 = Color(0XFF36E3C0);
  static const Color greenLv3 = Color(0XFF4FEACA);
  static const Color greenLv4 = Color(0XFF1FD4AF);

  static const Color blueLv1 = Color(0XFF0935c3);
  static const Color blueLv2 = Color(0XFF1D95D8);
  static const Color blueLv3 = Color(0XFF23B6E7);
  static const Color blueLv4 = Color(0XFFEAF5FD);
  static const Color blueLv5 = Color(0XFFF5FBFF);

  static lighten(Color color, [double amount = .1]) {
    assert(amount >= 0 && amount <= 1);
    final hsl = HSLColor.fromColor(color);
    final hslLight =
        hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));
    return hslLight.toColor();
  }

  static darken(Color color, [double amount = .1]) {
    assert(amount >= 0 && amount <= 1);
    final hsl = HSLColor.fromColor(color);
    final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));
    return hslDark.toColor();
  }
}
