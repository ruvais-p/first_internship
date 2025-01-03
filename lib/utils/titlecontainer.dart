
import 'package:flutter/material.dart';
import 'package:medi/UI_settings.dart';
import 'package:medi/utils/texts.dart';

class TitleContainer extends StatelessWidget {
  TitleContainer({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
          color: BG_COLOR_SUPPORT, borderRadius: BorderRadius.circular(10)),
      padding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
      width: double.infinity,
      height: 45,
      child: Texts(
          text: title, color: Colors.black, size: 18, fw: FontWeight.w500),
    );
  }
}
