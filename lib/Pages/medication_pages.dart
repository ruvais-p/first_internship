import 'package:flutter/material.dart';
import 'package:medi/DataBase/exampledb.dart';
import 'package:medi/UI_settings.dart';
import 'package:medi/utils/medication_listtile.dart';
import 'package:medi/utils/medicine_state_title.dart';

class Medication extends StatefulWidget {
  const Medication({super.key});

  @override
  _MedicationState createState() => _MedicationState();
}

class _MedicationState extends State<Medication> {
  final int AMNo = 3; // number of active medications
  final int PMNo = 3; // number of previous medications

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          height: 100,
          color: Colors.white,
          child: Container(
            width: double.infinity,
            height: 100,
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: PRIMARY_COLOR),
                color: PRIMARY_COLOR,
                borderRadius:
                    BorderRadius.only(bottomRight: Radius.circular(80))),
            padding: EdgeInsets.fromLTRB(20, 5, 10, 0),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Your",
                        style: MAJOR_FONT(
                            textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 23,
                          fontWeight: FontWeight.w500,
                        )),
                      ),
                      Text(
                        "Medication",
                        style: MAJOR_FONT(
                            textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.w400,
                        )),
                      )
                    ],
                  ),
                ]),
          ),
        ),
        Container(
            width: double.infinity,
            height: 540,
            alignment: Alignment.centerRight,
            decoration: BoxDecoration(
              color: PRIMARY_COLOR,
            ),
            child: Container(
              width: 390,
              height: 630,
              padding: EdgeInsets.fromLTRB(30, 9, 15, 8),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(width: 4, color: Colors.white),
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(80))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  MedicineStateTitle(
                    title: "Active Medication",
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    width: 350,
                    height: heightOfAMContainer(AMNo, PMNo),
                    child: ListView.builder(
                      itemCount: AMNo,
                      itemBuilder: (context, index) {
                        return MedicationPage_ListTile(
                          name: db[index][0],
                          quantity: "${db[index][10]} ${db[index][1]}",
                          compartment: db[index][4],
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  MedicineStateTitle(
                    title: "Previous Medication",
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    width: 350,
                    height: heightOfPMContainer(AMNo, PMNo),
                    child: ListView.builder(
                      itemCount: PMNo,
                      itemBuilder: (context, index) {
                        return MedicationPage_ListTile(
                          name: db[index][0],
                          quantity: "${db[index][10]} ${db[index][1]}",
                          compartment: db[index][4],
                        );
                      },
                    ),
                  )
                ],
              ),
            ))
      ],
    );
  }

  double heightOfAMContainer(int amNo, int pmNo) {
    if (amNo == 1 && pmNo >= 3) {
      return 110;
    } else if (amNo == 2 && pmNo >= 3) {
      return 220;
    } else if (amNo >= 3 && pmNo >= 3) {
      return 250;
    } else if (amNo >= 3 && pmNo == 1) {
      return 400;
    } else if (amNo >= 3 && pmNo == 2) {
      return 220;
    } else if (amNo == 1 && pmNo == 2) {
      return 110;
    } else {
      return 225; // Default return value for other cases
    }
  }

  double heightOfPMContainer(int amNo, int pmNo) {
    if (amNo == 1 && pmNo >= 3) {
      return 400;
    } else if (amNo == 2 && pmNo >= 3) {
      return 275;
    } else if (amNo >= 3 && pmNo >= 3) {
      return 250;
    } else if (amNo >= 3 && pmNo == 1) {
      return 110;
    } else if (amNo >= 3 && pmNo == 2) {
      return 220;
    } else if (amNo == 1 && pmNo == 2) {
      return 275;
    } else {
      return 225; // Default return value for other cases
    }
  }
}
