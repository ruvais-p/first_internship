import 'package:flutter/material.dart';
import 'package:medi/UI_settings.dart';

class MyTitle extends StatelessWidget {
  MyTitle({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 15,
          ),
          Text(
            title,
            textAlign: TextAlign.left,
            style: MAJOR_FONT(
              textStyle: const TextStyle(
                color: PRIMARY_COLOR,
                fontSize: 17,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
