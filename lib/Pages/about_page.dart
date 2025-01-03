import 'package:flutter/material.dart';
import 'package:medi/UI_settings.dart';
import 'package:medi/utils/texts.dart';

class About extends StatefulWidget {
  final VoidCallback changeCondition;
  About(this.changeCondition);

  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Texts(
          text: "About",
          color: Colors.black,
          size: 25,
          fw: FontWeight.w400,
        ),
        leading: IconButton(
          onPressed: () {
            widget.changeCondition();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black54,
            size: 28,
          ),
        ),
      ),
      body: Center(
        child: Text(
          "About content goes here",
          style: MAJOR_FONT(
            textStyle: const TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}
