import 'package:flutter/material.dart';
import 'package:medi/UI_settings.dart';

class Pillbox_Connectivity extends StatefulWidget {
  final VoidCallback changeCondition;
  Pillbox_Connectivity(this.changeCondition);

  @override
  State<Pillbox_Connectivity> createState() => _Pillbox_ConnectivityState();
}

class _Pillbox_ConnectivityState extends State<Pillbox_Connectivity> {
  bool _wifiEnabled = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "PIllbox Connectivity",
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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 35,
                  ),
                  _Texts(
                      "Complete the following steps to make sure app is connected with pillbox.",
                      Colors.black54,
                      15,
                      FontWeight.w400),
                  SizedBox(
                    height: 35,
                  ),
                  _Texts("Step 1", PRIMARY_COLOR, 17, FontWeight.w600),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            ListTile(
              horizontalTitleGap: 0,
              title: _Texts("Enable WI-Fi", Colors.black, 18, FontWeight.w600),
              subtitle: _Texts("Ensure Wi-Fi enabled on your mobile device",
                  Colors.black54, 14, FontWeight.w500),
              //Thi switch is help to control the wifi of pillbox............................................................................
              trailing: Switch(
                activeColor: Colors.white,
                activeTrackColor: PRIMARY_COLOR,
                inactiveTrackColor: Colors.white,
                value: _wifiEnabled,
                onChanged: (value) {
                  setState(() {
                    _wifiEnabled = !_wifiEnabled;
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _Texts(
                      "Make sure pillbox has enough battery to stay discoverable, only then you could see the pillbox network",
                      Colors.black87,
                      13,
                      FontWeight.w300),
                  SizedBox(
                    height: 15,
                  ),
                  _Texts("Step 2", PRIMARY_COLOR, 17, FontWeight.w600),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            ListTile(
              horizontalTitleGap: 0,
              title: _Texts(
                  "Connect to pillbox", Colors.black, 18, FontWeight.w600),
              subtitle: _Texts(
                  "Press the Wi-Fi icon (Top-right corner) on app bar to scan for available Wi-Fi",
                  Colors.black54,
                  14,
                  FontWeight.w500),
              trailing: Icon(
                Icons.arrow_forward_ios_rounded,
                color: Colors.black54,
                size: 15,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  _Texts("Step 3", PRIMARY_COLOR, 17, FontWeight.w600),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            ListTile(
              horizontalTitleGap: 0,
              title: _Texts(
                  "Select pillbox network", Colors.black, 18, FontWeight.w600),
              subtitle: _Texts(
                  "Select the respective network from the available Wi-Fi.",
                  Colors.black54,
                  14,
                  FontWeight.w500),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _Texts("Is it helpful?", Colors.black54, 14, FontWeight.w400),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          alignment: Alignment.center,
                          width: 150,
                          height: 50,
                          child:
                              _Texts("NO", PRIMARY_COLOR, 20, FontWeight.w600),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(
                                color: PRIMARY_COLOR,
                                width: 2,
                              )),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          alignment: Alignment.center,
                          width: 150,
                          height: 50,
                          child:
                              _Texts("YES", Colors.white, 20, FontWeight.w600),
                          decoration: BoxDecoration(
                              color: PRIMARY_COLOR,
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(
                                color: PRIMARY_COLOR,
                                width: 2,
                              )),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ));
  }
}

Widget _Texts(String text, Color color, double size, FontWeight fw) {
  return Text(
    text,
    textAlign: TextAlign.left,
    style: MAJOR_FONT(
      textStyle: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: fw,
      ),
    ),
  );
}
