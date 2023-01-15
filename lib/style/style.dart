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
  static const textInput = Color.fromARGB(255, 233, 233, 233);
  static const mediumGreen = Color(0xff2AAF7F);
  static const lightGreen = Color(0xffC8DFC3);

  static const transparent = Colors.transparent;
  static const like = Color(0xffEC534A);
  static Color shimmerBase = Colors.grey.shade300;

  static textStyleNormal(
      {int size = 12, Color color = darkGreen, num fontWeigth = 400}) {
    return TextStyle(
        color: color, fontSize: size.toDouble(), fontWeight: FontWeight.w400);
  }

  static textStyleSemiBold(
      {int size = 12, Color color = darkGreen, num fontWeigth = 400}) {
    return TextStyle(
        color: color, fontSize: size.toDouble(), fontWeight: FontWeight.w600);
  }

  static textStyleBold(
      {int size = 12, Color color = darkGreen, num fontWeigth = 400}) {
    return TextStyle(
        color: color, fontSize: size.toDouble(), fontWeight: FontWeight.bold);
  }
}
