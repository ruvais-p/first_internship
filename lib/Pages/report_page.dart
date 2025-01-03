import 'package:flutter/material.dart';
import 'package:medi/DataBase/exampledb.dart';
import 'package:medi/UI_settings.dart';
import 'package:medi/utils/reportpage_listtile.dart';
import 'package:medi/utils/texts.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Report extends StatelessWidget {
  const Report({super.key});

  Color StatusColor(int value) {
    if (value == 0) {
      return STATUS_COLOR_1;
    } else if (value == 1) {
      return TERTIARY_COLOR;
    } else {
      return STATUS_COLOR_2;
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData('Missed', 2, TERTIARY_COLOR),
      ChartData('Snoozed', 1, STATUS_COLOR_2),
      ChartData('Taken', 6, STATUS_COLOR_1)
    ];
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          height: 100,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: PRIMARY_COLOR),
            color: PRIMARY_COLOR,
          ),
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
                      "Adherence",
                      style: MAJOR_FONT(
                          textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 23,
                        fontWeight: FontWeight.w500,
                      )),
                    ),
                    Text(
                      "Report",
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
        Container(
          width: double.infinity,
          height: 220,
          alignment: Alignment.center,
          padding: EdgeInsets.all(15),
          color: Colors.white,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Texts(
                      text: "Weekly Performance",
                      color: Colors.black,
                      size: 18,
                      fw: FontWeight.w400),
                  SizedBox(
                    height: 10,
                  ),
                  Texts(
                    text: "31 Mar - 06 Apr 2024",
                    size: 15,
                    color: Colors.black54,
                    fw: FontWeight.w400,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  chartNotifier("6  Taken", STATUS_COLOR_1),
                  chartNotifier("1  Snoozed  ", STATUS_COLOR_2),
                  chartNotifier("2  Missed", TERTIARY_COLOR),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Texts(
                          text: "70%",
                          color: STATUS_COLOR_1,
                          size: 23,
                          fw: FontWeight.w500),
                      Texts(
                          text: " Taken Percentage",
                          color: Colors.black,
                          size: 15,
                          fw: FontWeight.w400)
                    ],
                  )
                ],
              ),
              Container(
                width: 170,
                height: 200,
                color: Colors.white,
                child: SfCircularChart(series: <CircularSeries>[
                  RadialBarSeries<ChartData, String>(
                      useSeriesColor: true,
                      trackOpacity: 0.3,
                      dataSource: chartData,
                      xValueMapper: (ChartData data, _) => data.x,
                      yValueMapper: (ChartData data, _) => data.y,
                      pointColorMapper: (ChartData data, _) => data.c,
                      radius: '100%',
                      cornerStyle: CornerStyle.bothCurve),
                ]),
              )
            ],
          ),
        ),
        Center(
          child: Container(
            width: 400,
            height: 362,
            color: Colors.white,
            padding: EdgeInsets.only(left: 7),
            child: ListView.builder(
              itemCount: db.length,
              itemBuilder: (context, index) {
                return ReportPage_ListTile(
                    name: db[index][0],
                    time:
                        "${db[index][9][0]}:${db[index][9][1]} ${db[index][9][2]}",
                    color: StatusColor(db[index][13]));
              },
            ),
          ),
        )
      ],
    );
  }

  Row chartNotifier(String heading, Color color) {
    return Row(
      children: [
        CircleAvatar(
          radius: 7,
          backgroundColor: color,
        ),
        SizedBox(
          width: 15,
        ),
        Texts(text: heading, color: Colors.black, size: 16, fw: FontWeight.w500)
      ],
    );
  }
}

class ChartData {
  ChartData(this.x, this.y, this.c);
  final String x;
  final double y;
  final Color c;
}
