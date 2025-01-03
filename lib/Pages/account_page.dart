import 'package:flutter/material.dart';
import 'package:medi/UI_settings.dart';
import 'package:medi/utils/texts.dart';
import 'package:medi/utils/title.dart';

class Account extends StatefulWidget {
  final VoidCallback changeCondition;
  Account(this.changeCondition);

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  bool _finger = false;
  bool _emergancyCall = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Texts(
            text: "Account",
            color: Colors.black,
            size: 25,
            fw: FontWeight.w400),
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
          MyTitle(
            title: "Fingerprint Lock",
          ),
          ListTile(
            horizontalTitleGap: 0,
            title: _Texts(
                "Unlock with fingerprint", Colors.black, 18, FontWeight.w600),
            subtitle: _Texts(
                "When enabled, you'll need to use fingerprint to open Redicine App. You'll \nstill get reminders if app is locked",
                Colors.black54,
                14,
                FontWeight.w500),
            trailing: Switch(
              activeColor: Colors.white,
              activeTrackColor: PRIMARY_COLOR,
              inactiveTrackColor: Colors.white,
              value: _finger,
              onChanged: (value) {
                setState(() {
                  _finger = !_finger;
                });
              },
            ),
          ),
          MyTitle(title: "Change Mobile Number"),
          ListTile(
              horizontalTitleGap: 0,
              title: _Texts(
                  "Change Mobile Number", Colors.black, 18, FontWeight.w600),
              subtitle: _Texts(
                  "Changing your mobile number will migrate your account info, reminders & setting.",
                  Colors.black54,
                  14,
                  FontWeight.w500),
              trailing: const Icon(
                Icons.arrow_forward_ios_rounded,
                color: Colors.black54,
                size: 20,
              )),
          MyTitle(
            title: "Emergency SOS",
          ),
          ListTile(
            horizontalTitleGap: 0,
            title: _Texts("Emergancy SOS", Colors.black, 18, FontWeight.w600),
            subtitle: _Texts(
                "You can directly make a call to your emergency contact from settings",
                Colors.black54,
                14,
                FontWeight.w500),
            trailing: Switch(
              activeColor: Colors.white,
              activeTrackColor: PRIMARY_COLOR,
              inactiveTrackColor: Colors.white,
              value: _emergancyCall,
              onChanged: (value) {
                setState(() {
                  _emergancyCall = !_emergancyCall;
                });
              },
            ),
          ),
          ListTile(
            title:
                _Texts("Emergancy Contact", Colors.black, 18, FontWeight.w600),
            trailing: const Icon(
              Icons.arrow_forward_ios_rounded,
              color: Colors.black54,
              size: 20,
            ),
          ),
          MyTitle(
            title: "Delete My Account",
          ),
          ListTile(
              horizontalTitleGap: 0,
              title: _Texts(
                  "Delete My Account", Colors.black, 18, FontWeight.w600),
              subtitle: const Texts(
                  text:
                      "Warning! This action is permanant and \ncan not be reversed. All of your account and medication data will be...",
                  color: Colors.black54,
                  size: 14,
                  fw: FontWeight.w500),
              trailing: const Icon(
                Icons.arrow_forward_ios_rounded,
                color: Colors.black54,
                size: 20,
              )),
        ],
      ),
    );
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
