import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  CustomText(
      {super.key, required this.font, this.fontWeight, required this.text});
  String text;
  double font;
  FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: TextAlign.center,
      text,
      style: TextStyle(
          fontSize: font,
          fontWeight: fontWeight ?? FontWeight.w700,
          color: const Color.fromARGB(255, 255, 252, 252)),
    );
  }
}
