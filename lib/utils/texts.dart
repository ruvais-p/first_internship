import 'package:flutter/material.dart';
import 'package:medi/UI_settings.dart';

class Texts extends StatelessWidget {
  const Texts(
      {super.key,
      required this.text,
      required this.color,
      required this.size,
      required this.fw});
  final String text;
  final Color color;
  final double size;
  final FontWeight fw;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.left,
      style: MAJOR_FONT(
        textStyle: TextStyle(
          color: color,
          fontSize: size,
          fontWeight: fw,
        ),
      ),
    );
  }
}
