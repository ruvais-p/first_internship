import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:medi/Authentication_pages/nomberverification_page.dart';
import 'package:medi/UI_settings.dart';
import 'package:medi/utils/texts.dart';

class Signup_Page extends StatefulWidget {
  const Signup_Page({super.key});

  @override
  State<Signup_Page> createState() => _Signup_PageState();
}

class _Signup_PageState extends State<Signup_Page> {
  final TextEditingController _firstName = TextEditingController();
  final TextEditingController _lastName = TextEditingController();
  final TextEditingController _phoneNumber = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _dob = TextEditingController();

  int _lengthOfPhonenumber = 0;
  String? _selectedGender;
  DateTime _selectedDate = DateTime.now();
  bool checkedState = false;
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(1950),
      lastDate: DateTime(DateTime.now().year + 1),
      builder: (context, child) {
        return Theme(
            data: ThemeData.light().copyWith(
                colorScheme: ColorScheme.light(
              primary: PRIMARY_COLOR,
              onPrimary: Colors.white,
              onBackground: PRIMARY_COLOR,
              surface: Colors.white,
              onSurface: Colors.black,
              onSurfaceVariant: PRIMARY_COLOR,
            )),
            child: child!);
      },
    );
    if (picked != null && picked != _selectedDate)
      setState(() {
        _selectedDate = picked;
      });
  }

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
                fw: FontWeight.w400),
          ),
          const SizedBox(
            width: 30,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Texts(
                        text: "Sign Up",
                        color: Colors.black,
                        size: 50,
                        fw: FontWeight.w400),
                    const SizedBox(
                      height: 5,
                    ),
                    Texts(
                        text: "Fill in the Details to have a personal touch!",
                        color: Colors.black54,
                        size: 16,
                        fw: FontWeight.w400),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: 350,
                      height: 70,
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your first name';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.name,
                        controller: _firstName,
                        style: MAJOR_FONT(
                          textStyle: const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        decoration: InputDecoration(
                          labelText: "First Name",
                          labelStyle: MAJOR_FONT(
                            textStyle: const TextStyle(
                              color: Colors.black87,
                              fontSize: 20,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          enabledBorder: const UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 2.0),
                          ),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 2.0),
                          ),
                          counterStyle: MAJOR_FONT(
                            textStyle: const TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: 350,
                      height: 70,
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your last name';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.name,
                        controller: _lastName,
                        style: MAJOR_FONT(
                          textStyle: const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        decoration: InputDecoration(
                          labelText: "Last Name",
                          labelStyle: MAJOR_FONT(
                            textStyle: const TextStyle(
                              color: Colors.black87,
                              fontSize: 20,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          enabledBorder: const UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 2.0),
                          ),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 2.0),
                          ),
                          counterStyle: MAJOR_FONT(
                            textStyle: const TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
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
                            _lengthOfPhonenumber = value.length;
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
                            borderSide:
                                BorderSide(color: Colors.black, width: 2.0),
                          ),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 2.0),
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
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: 350,
                      height: 70,
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email id';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.emailAddress,
                        controller: _email,
                        style: MAJOR_FONT(
                          textStyle: const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        decoration: InputDecoration(
                          labelText: "Email ID",
                          labelStyle: MAJOR_FONT(
                            textStyle: const TextStyle(
                              color: Colors.black87,
                              fontSize: 20,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          enabledBorder: const UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 2.0),
                          ),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 2.0),
                          ),
                          counterStyle: MAJOR_FONT(
                            textStyle: const TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        _selectDate(context);
                        setState(() {
                          checkedState = true;
                        });
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Texts(
                                  text: checkedState ? "Date of BIRTH" : "",
                                  color: Colors.black54,
                                  size: 15,
                                  fw: FontWeight.w400),
                            ],
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            width: 400,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 0.0),
                                        child: Text(
                                          checkedState
                                              ? DateFormat('dd MMMM yyyy')
                                                  .format(_selectedDate)
                                              : "Bate of BIRTH",
                                          style: checkedState
                                              ? TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w400,
                                                )
                                              : TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w300,
                                                ),
                                        ),
                                      ),
                                    ),
                                    Icon(
                                      CupertinoIcons.calendar,
                                      color: Colors.black87,
                                      size: 30,
                                    ),
                                    SizedBox(
                                      width: 20,
                                    )
                                  ],
                                ),
                                Divider(
                                  color: Colors.black,
                                  thickness: 2,
                                  indent: 0,
                                  endIndent: 20,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Texts(
                        text: "Gender",
                        color: Colors.black,
                        size: 20,
                        fw: FontWeight.w400),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: RadioListTile<String>(
                            activeColor: PRIMARY_COLOR,
                            hoverColor: PRIMARY_COLOR,
                            overlayColor:
                                MaterialStateProperty.resolveWith<Color?>(
                              (Set<MaterialState> states) {
                                return Colors
                                    .transparent; // Disable overlay effect
                              },
                            ),
                            tileColor: Colors.transparent,
                            title: Texts(
                                text: "Male",
                                color: Colors.black87,
                                size: 17,
                                fw: FontWeight.w300),
                            value: 'male',
                            groupValue: _selectedGender,
                            onChanged: (value) {
                              setState(() {
                                _selectedGender = value;
                              });
                            },
                            contentPadding: const EdgeInsets.only(left: 0.0),
                          ),
                        ),
                        Expanded(
                          child: RadioListTile<String>(
                            activeColor: PRIMARY_COLOR,
                            title: Texts(
                                text: "Female",
                                color: Colors.black87,
                                size: 17,
                                fw: FontWeight.w300),
                            value: 'female',
                            groupValue: _selectedGender,
                            onChanged: (value) {
                              setState(() {
                                _selectedGender = value;
                              });
                            },
                            contentPadding: const EdgeInsets.only(left: 0.0),
                          ),
                        ),
                      ],
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
                                    fontWeight: FontWeight.w600)),
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: PRIMARY_COLOR,
                          borderRadius: BorderRadius.circular(40),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Texts(
                            text: "By proceeding, you agree to our ",
                            color: Colors.black54,
                            size: 17,
                            fw: FontWeight.w400),
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
                                  decorationColor: Colors.black87),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Texts(
                          text: "and that you have read our ",
                          color: Colors.black54,
                          size: 17,
                          fw: FontWeight.w400),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          " Policy.",
                          style: MAJOR_FONT(
                            textStyle: const TextStyle(
                                color: Colors.black87,
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.black87),
                          ),
                        ),
                      ),
                    ])
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
