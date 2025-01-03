import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medi/Authentication_pages/nomberverification_page.dart';
import 'package:medi/UI_settings.dart';
import 'package:medi/utils/texts.dart';

class Login_Page extends StatefulWidget {
  const Login_Page({super.key});

  @override
  State<Login_Page> createState() => _Login_PageState();
}

class _Login_PageState extends State<Login_Page> {
  final TextEditingController _phoneNumber = TextEditingController();
  int _lengthOfPhoneNumber = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black54,
            size: 28,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {},
            child: Texts(
              text: "Help",
              color: PRIMARY_COLOR,
              size: 20,
              fw: FontWeight.w400,
            ),
          ),
          const SizedBox(width: 30),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          alignment: Alignment.topLeft,
          padding: const EdgeInsetsDirectional.only(start: 20, end: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Texts(
                text: "Log In",
                color: Colors.black,
                size: 50,
                fw: FontWeight.w400,
              ),
              const SizedBox(height: 5),
              Texts(
                text: "Please enter your mobile number to continue",
                color: Colors.black54,
                size: 16,
                fw: FontWeight.w400,
              ),
              const SizedBox(height: 50),
              SizedBox(
                width: 350,
                height: 100,
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your mobile number';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      _lengthOfPhoneNumber = value.length;
                    });
                  },
                  keyboardType: TextInputType.phone,
                  controller: _phoneNumber,
                  style: MAJOR_FONT(
                    textStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  decoration: InputDecoration(
                    labelText: "Mobile Number",
                    labelStyle: MAJOR_FONT(
                      textStyle: const TextStyle(
                        color: Colors.black87,
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 2.0),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 2.0),
                    ),
                    counterStyle: MAJOR_FONT(
                      textStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  maxLength: 10,
                ),
              ),
              SizedBox(
                height: 400,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NumberVerificationPage(),
                      ));
                },
                child: Container(
                  height: 60,
                  child: Center(
                    child: Text(
                      "CONTINUE",
                      style: GoogleFonts.mPlus2(
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: PRIMARY_COLOR,
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
              ),
              const SizedBox(height: 14),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Texts(
                    text: "By proceeding, you agree to our ",
                    color: Colors.black54,
                    size: 17,
                    fw: FontWeight.w400,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      "Terms ",
                      style: MAJOR_FONT(
                        textStyle: const TextStyle(
                          color: Colors.black87,
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.black87,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Texts(
                    text: "and that you have read our ",
                    color: Colors.black54,
                    size: 17,
                    fw: FontWeight.w400,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      "Policy.",
                      style: MAJOR_FONT(
                        textStyle: const TextStyle(
                          color: Colors.black87,
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.black87,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
