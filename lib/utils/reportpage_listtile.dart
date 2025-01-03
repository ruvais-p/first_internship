import 'package:flutter/material.dart';
import 'package:medi/UI_settings.dart';
import 'package:medi/utils/texts.dart';

class ReportPage_ListTile extends StatelessWidget {
  ReportPage_ListTile(
      {super.key, required this.name, required this.time, required this.color});
  final String name;
  final String time;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Row(
            children: [
              Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width - 20,
                    height: 73,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                      color: color,
                    ),
                    child: Container(
                      width: MediaQuery.of(context).size.width - 20,
                      height: 73,
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                              bottomRight: Radius.circular(10)),
                          color: SECONDARY_COLOR_2),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Icon(
                              Icons.medication,
                              color: Colors.black,
                              size: 50,
                            ),
                          ),
                          Container(
                            width: 304,
                            height: 58,
                            color: SECONDARY_COLOR_2,
                            padding: EdgeInsets.only(left: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Texts(
                                    text: name,
                                    color: Colors.black,
                                    size: 25,
                                    fw: FontWeight.w500),
                                Texts(
                                    text: time,
                                    color: Colors.black54,
                                    size: 15,
                                    fw: FontWeight.w400)
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 20,
                      height: 73,
                      decoration: BoxDecoration(
                          color: color,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              bottomRight: Radius.circular(10))),
                    ),
                  )
                ],
              ),
            ],
          ),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
