import 'package:flutter/material.dart';
import 'package:medi/utils/texts.dart';

class MedicationPage_ListTile extends StatelessWidget {
  MedicationPage_ListTile({
    super.key,
    required this.name,
    required this.quantity,
    required this.compartment,
  });
  String name;
  String quantity;
  int compartment;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            width: 350,
            height: 105,
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
                  width: 200,
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
