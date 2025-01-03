import 'package:flutter/material.dart';
import 'package:medi/UI_settings.dart';

class Help extends StatefulWidget {
  final VoidCallback changeCondition;

  Help(this.changeCondition);

  @override
  _HelpState createState() => _HelpState();
}

class _HelpState extends State<Help> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Help",
          style: MAJOR_FONT(
            textStyle: const TextStyle(
              color: Colors.black,
              fontSize: 25,
              fontWeight: FontWeight.w400,
            ),
          ),
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
          "Help content goes here",
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
