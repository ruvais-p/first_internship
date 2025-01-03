import 'package:flutter/material.dart';
import 'package:medi/utils/texts.dart';

class MedicineStateTitle extends StatelessWidget {
  const MedicineStateTitle({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 40,
      padding: EdgeInsets.only(right: 20),
      alignment: Alignment.centerRight,
      decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), bottomLeft: Radius.circular(20))),
      child: Texts(
          text: title, color: Colors.black, size: 18, fw: FontWeight.w400),
    );
  }
}
