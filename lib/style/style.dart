import 'package:flutter/material.dart';

abstract class Style {
  Style._();

  static const primaryColor = Color(0xff26AD71);
  static const greyColor = Color(0xff777777);
  static const white = Colors.white;
  static const black = Colors.black;
  static const bgCategory = Color(0xffF3E9DD);
  static const bgProduct = Color(0xffF1F4F3);
  static const darkGreen = Color(0xff194B38);
  static Color shimmerBase = Colors.grey.shade300;

  textStyleF({int size = 12, Color color = darkGreen}) {
    return TextStyle(color: color, fontSize: size.toDouble());
  }
}
