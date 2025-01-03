import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medi/UI_settings.dart';

class OTP extends StatelessWidget {
  const OTP({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 65,
      width: 60,
      child: TextFormField(
        keyboardType: TextInputType.number,
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
        textAlign: TextAlign.center,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
        cursorColor: Colors.transparent,
        style: MAJOR_FONT(
            textStyle: TextStyle(
                fontSize: 20,
                color: PRIMARY_COLOR,
                fontWeight: FontWeight.w600)),
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey.shade100,
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: PRIMARY_COLOR, width: 3)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: PRIMARY_COLOR, width: 1.5))),
      ),
    );
  }
}
