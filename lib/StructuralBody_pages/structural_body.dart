import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medi/Pages/about_page.dart';
import 'package:medi/Pages/account_page.dart';
import 'package:medi/Pages/add_medicine_page.dart';
import 'package:medi/Pages/caregiver_page.dart';
import 'package:medi/Pages/help_page.dart';
import 'package:medi/Pages/home_page.dart';
import 'package:medi/Pages/medication_pages.dart';
import 'package:medi/Pages/pillbox_page.dart';
import 'package:medi/Pages/profile_page.dart';
import 'package:medi/Pages/report_page.dart';
import 'package:medi/UI_settings.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  double value = 0;
  int _currentIndex = 0;
  int _settingsIndex = 0;

  List<Widget> bottomNavigations = const [
    Icon(Icons.all_inbox),
    Icon((CupertinoIcons.capsule)),
    Icon(CupertinoIcons.graph_circle)
  ];

  void changeCondition() {
    setState(() {
      value = 1;
      _settingsIndex = 0;
    });
  }

  List<Widget> settings() {
    return [
      Profile(changeCondition),
      Account(changeCondition),
      Caregiver(changeCondition),
      Pillbox_Connectivity(changeCondition),
      Help(changeCondition),
      About(changeCondition),
    ];
  }

  List<Widget> navigationPages = [
    HomePage_Body(),
    Medication(),
    Report(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 5, 31, 52),
                const Color.fromARGB(255, 5, 23, 37)
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            )),
          ),
          SafeArea(
              child: Container(
            width: 300,
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                            onTap: () {
                              setState(() {
                                _settingsIndex = 1;
                                value = 0;
                              });
                            },
                            child: ClipOval(
                              key: ValueKey<int>(0),
                              child: Image.asset(
                                "lib/assets/images/JHON.jpg",
                                fit: BoxFit.cover,
                                height: 100,
                                width: 100,
                              ),
                            )),
                        SizedBox(
                          height: 6,
                        ),
                        Text(
                          "John Luther",
                          style: MAJOR_FONT(
                              textStyle: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 20)),
                        ),
                      ],
                    )),
                  ],
                ),
                SizedBox(
                  height: 100,
                ),
                Expanded(
                    child: ListView(
                  children: [
                    ListTile(
                      onTap: () {
                        setState(() {
                          _settingsIndex = 2;
                          value = 0;
                        });
                      },
                      leading: Icon(
                        Icons.vpn_key_outlined,
                        color: Colors.white,
                        size: 28,
                      ),
                      title: Text(
                        "Account",
                        style: MAJOR_FONT(
                            textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 23,
                          fontWeight: FontWeight.w500,
                        )),
                      ),
                    ),
                    ListTile(
                      onTap: () {
                        setState(() {
                          _settingsIndex = 3;
                          value = 0;
                        });
                      },
                      leading: Icon(
                        CupertinoIcons.person_alt_circle,
                        color: Colors.white,
                        size: 28,
                      ),
                      title: Text(
                        "Caregiver",
                        style: MAJOR_FONT(
                            textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 23,
                          fontWeight: FontWeight.w500,
                        )),
                      ),
                    ),
                    ListTile(
                      onTap: () {
                        setState(() {
                          _settingsIndex = 4;
                          value = 0;
                        });
                      },
                      leading: Icon(
                        Icons.add_box_outlined,
                        color: Colors.white,
                        size: 28,
                      ),
                      title: Text(
                        "Pillbox",
                        style: MAJOR_FONT(
                            textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 23,
                          fontWeight: FontWeight.w500,
                        )),
                      ),
                    ),
                    ListTile(
                      onTap: () {
                        setState(() {
                          _settingsIndex = 5;
                          value = 0;
                        });
                      },
                      leading: Icon(
                        Icons.help_outline,
                        color: Colors.white,
                        size: 28,
                      ),
                      title: Text(
                        "Help",
                        style: MAJOR_FONT(
                            textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 23,
                          fontWeight: FontWeight.w500,
                        )),
                      ),
                    ),
                    ListTile(
                      onTap: () {
                        setState(() {
                          _settingsIndex = 6;
                          value = 0;
                        });
                      },
                      leading: Icon(
                        Icons.all_inbox_outlined,
                        color: Colors.white,
                        size: 28,
                      ),
                      title: Text(
                        "About",
                        style: MAJOR_FONT(
                            textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 23,
                          fontWeight: FontWeight.w500,
                        )),
                      ),
                    ),
                    SizedBox(
                      height: 100,
                    ),
                    Divider(
                      color: Colors.white60,
                      indent: 5,
                      endIndent: 130,
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    ListTile(
                      onTap: () {},
                      leading: Icon(
                        Icons.logout_rounded,
                        color: Colors.white54,
                        size: 28,
                      ),
                      title: Text(
                        "Logout",
                        style: MAJOR_FONT(
                            textStyle: TextStyle(
                          color: Colors.white54,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        )),
                      ),
                    ),
                  ],
                )),
              ],
            ),
          )),
          TweenAnimationBuilder<double>(
            tween: Tween<double>(begin: 0, end: value),
            curve: Curves.easeInOut,
            duration: Duration(milliseconds: 800), // Adjust duration if needed
            builder: (_, double val, __) {
              return Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..setEntry(0, 3, 200 * val)
                  ..rotateY((pi / 6) * val),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(24 * val)),
                  child: AnimatedSwitcher(
                    duration: Duration(
                        milliseconds:
                            800), // Duration for the transition animation
                    transitionBuilder:
                        (Widget child, Animation<double> animation) {
                      return FadeTransition(
                        opacity: animation,
                        child: child,
                      );
                    },
                    child: _settingsIndex == 0
                        ? HomePage(key: ValueKey<int>(_settingsIndex))
                        : settings()[_settingsIndex - 1],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Scaffold HomePage({required ValueKey<int> key}) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 50,
        backgroundColor: PRIMARY_COLOR,
        leading: Row(
          children: [
            SizedBox(
              width: 10,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  value == 0 ? value = 1 : value = 0;
                });
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 500),
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: AnimatedSwitcher(
                  duration: Duration(milliseconds: 500),
                  transitionBuilder:
                      (Widget child, Animation<double> animation) {
                    return FadeTransition(opacity: animation, child: child);
                  },
                  child: value == 0
                      ? ClipOval(
                          key: ValueKey<int>(0),
                          child: Image.asset(
                            "lib/assets/images/JHON.jpg",
                            fit: BoxFit.cover,
                            height: 45,
                            width: 45,
                          ),
                        )
                      : Icon(
                          key: ValueKey<int>(1),
                          Icons.cancel_outlined,
                          color: PRIMARY_COLOR,
                          size: 25,
                        ),
                ),
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.wifi_tethering_error_rounded_rounded,
                color: Colors.white,
                size: 35,
              ))
        ],
      ),
      bottomNavigationBar: BottomNavigationbar(),
      //navigation pages are here ...........................................................................
      body: navigationPages[_currentIndex],
      floatingActionButton: _currentIndex != 2
          ? FloatingActionButton(
              heroTag: null,
              onPressed: () async {
                final value = await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AddItem(
                              compartNo: 0,
                            )));
                if (value == "inserted") {
                  setState(() {});
                }
              },
              backgroundColor: PRIMARY_COLOR,
              child: Icon(
                CupertinoIcons.add,
                color: Colors.white,
                size: 40,
              ),
              splashColor: SPLASH_COLOR,
            )
          : null,
    );
  }

  //BottomNavigation Bar
  BottomNavigationBar BottomNavigationbar() {
    return BottomNavigationBar(
      elevation: 0,
      landscapeLayout: BottomNavigationBarLandscapeLayout.linear,
      useLegacyColorScheme: true,
      backgroundColor: Colors.white,
      type: BottomNavigationBarType.values.first,
      iconSize: 25,
      selectedItemColor: PRIMARY_COLOR,
      unselectedItemColor: Colors.grey.shade500,
      selectedLabelStyle: MAJOR_FONT(
          textStyle: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
      )),
      unselectedLabelStyle: MAJOR_FONT(
          textStyle: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
      )),
      currentIndex: _currentIndex,
      onTap: (value) {
        setState(() {
          _currentIndex = value;
        });
      },
      items: [
        BottomNavigationBarItem(
            icon: Icon(
              Icons.all_inbox,
            ),
            label: "Home"),
        BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.capsule), label: "Medication"),
        BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.graph_circle), label: "Report")
      ],
    );
  }
}
