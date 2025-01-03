import 'package:flutter/material.dart';
import 'package:medi/UI_settings.dart';
import 'package:medi/utils/texts.dart';

class HomePage_ListTile extends StatelessWidget {
  HomePage_ListTile(
      {super.key,
      required this.name,
      required this.quantity,
      required this.compartment,
      required this.time,
      required this.statusvalue});
  String name;
  String quantity;
  int compartment;
  String time;
  int statusvalue = 0;
  Color statuColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 120,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 60,
                  height: 90,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    image: DecorationImage(
                      image: AssetImage("lib/assets/images/pill_tile.png"),
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
                Container(
                  width: 175,
                  height: 120,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.white),
                      color: Colors.white),
                  padding: const EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Texts(
                          text: name,
                          color: Colors.black,
                          size: 20,
                          fw: FontWeight.w500),
                      Texts(
                          text: quantity,
                          color: Colors.black87,
                          size: 17,
                          fw: FontWeight.w400),
                      Container(
                        width: 150,
                        height: 30,
                        decoration: const BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20),
                                bottomRight: Radius.circular(20))),
                        child: Center(
                          child: Texts(
                              text: "Compatrment $compartment",
                              color: Colors.black87,
                              size: 15,
                              fw: FontWeight.w400),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  width: 135,
                  height: 120,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(width: 1, color: Colors.white)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Texts(
                          text: time,
                          color: Colors.black,
                          size: 20,
                          fw: FontWeight.w500),
                      Texts(
                          text: StatusText(statusvalue),
                          color: statuColor,
                          size: 15,
                          fw: FontWeight.w500)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String StatusText(int value) {
    if (value == 0) {
      statuColor = STATUS_COLOR_1;
      return "Pending";
    } else if (value == 1) {
      statuColor = STATUS_COLOR_1;
      return "Completed";
    } else {
      statuColor = STATUS_COLOR_2;
      return "Snoozed";
    }
  }
}
