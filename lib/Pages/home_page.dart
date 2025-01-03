import 'package:flutter/material.dart';
import 'package:medi/DataBase/exampledb.dart';
import 'package:medi/Pages/add_medicine_page.dart';
import 'package:medi/UI_settings.dart';
import 'package:medi/utils/homepage_listtile.dart';

class HomePage_Body extends StatelessWidget {
  HomePage_Body({super.key});

  String getGreeting() {
    int hour = DateTime.now().hour;
    if (hour < 12) {
      return "Good Morning";
    } else if (hour < 17) {
      return "Good Afternoon";
    } else {
      return "Good Evening";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: PRIMARY_COLOR,
                    border: Border.all(width: 1, color: PRIMARY_COLOR),
                  ),
                  width: double.infinity,
                  height: 150,
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
                            getGreeting(),
                            style: MAJOR_FONT(
                                textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 23,
                              fontWeight: FontWeight.w500,
                            )),
                          ),
                          Text(
                            "Jhon",
                            style: MAJOR_FONT(
                                textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              fontWeight: FontWeight.w400,
                            )),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 55,
                  color: Colors.white,
                ),
              ],
            ),
            Positioned(
              top: 150 - (90 / 2),
              left: 10,
              child: MedicineContainers(context),
            ),
            Positioned(
              top: 123,
              right: 10,
              child: FloatingActionButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddItem(
                        compartNo: 5,
                      ),
                    ),
                  );
                },
                backgroundColor: Colors.white,
                child: Text(
                  "0",
                  style: MAJOR_FONT(
                      textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  )),
                ),
              ),
            )
          ],
        ),
        Container(
          width: double.infinity,
          height: 50,
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: PRIMARY_COLOR,
                  size: 30,
                ),
              ),
              Container(
                width: 280,
                height: 50,
                color: Colors.white,
                alignment: Alignment.center,
                child: Text(
                  "Tommorow, 25 May 2024",
                  style: MAJOR_FONT(
                      textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  )),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: PRIMARY_COLOR,
                  size: 30,
                ),
              )
            ],
          ),
        ),
        Divider(
          thickness: 1,
          color: Colors.black,
          indent: 15,
          endIndent: 15,
        ),
        Expanded(
          child: Container(
            color: Colors.white,
            child: ListView.builder(
              itemCount: db.length,
              itemBuilder: (context, index) {
                return HomePage_ListTile(
                  name: db[index][0],
                  quantity: "${db[index][10]} ${db[index][1]}",
                  compartment: db[index][4],
                  time:
                      "${db[index][9][0]}:${db[index][9][1]} ${db[index][9][2]}",
                  statusvalue: db[index][13],
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget MedicineContainers(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 15, 0, 15),
      width: 312,
      height: 90,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13),
        color: SECONDARY_COLOR,
      ),
      child: ListView.builder(
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddItem(
                    compartNo: index,
                  ),
                ),
              );
            },
            child: CompartmentBlock(title: "${index + 1}"),
          );
        },
      ),
    );
  }
}

class CompartmentBlock extends StatelessWidget {
  const CompartmentBlock({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      alignment: Alignment.center,
      width: 50,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(9),
      ),
      child: Text(
        title,
        style: MAJOR_FONT(
            textStyle: TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        )),
      ),
    );
  }
}
