import 'package:flutter/material.dart';

class AppColors{
  static const Color white = Color(0xffD9D9D9);
  static const Color black = Color(0xff000000);
  static const Color rgbaColor = Color.fromRGBO(108, 108, 108, 0.25);

  static const Color gradientColor1 = Color.fromRGBO(183, 183, 183, 0.45); // #B7B7B7
  static const Color gradientColor2 = Color.fromRGBO(139, 139, 139, 0.45); // #8B8B8B
  static const Color gradientColor3 = Color.fromRGBO(102, 102, 102, 0.45); // #666666

  static const LinearGradient textFieldGradientBorder = LinearGradient(
    colors: [
      gradientColor1,
      gradientColor2,
      gradientColor3,
    ],
    stops: [
      0.0,
      0.5,
      1.0,
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}