import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medi/UI_settings.dart';

class Profile extends StatefulWidget {
  final VoidCallback changeCondition;
  Profile(this.changeCondition);
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final TextEditingController _firstName = TextEditingController();
  final TextEditingController _lastName = TextEditingController();
  final TextEditingController _phoneNumber = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _dob = TextEditingController();

  int _lengthOfPhonenumber = 0;
  String? _selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
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
        actions: [
          GestureDetector(
            onTap: () {},
            child: Text(
              "Save",
              style: MAJOR_FONT(
                textStyle: const TextStyle(
                  color: PRIMARY_COLOR,
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 30,
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Stack(
                  children: [
                    Center(
                      child: Container(
                        width: 150.0,
                        height: 150.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.black38, width: 2.0),
                        ),
                        child: ClipOval(
                          child: Image.asset(
                            "lib/assets/images/JHON.jpg",
                            fit: BoxFit.cover,
                            width: 150.0,
                            height: 150.0,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                        top: 100,
                        left: 225,
                        child: CircleAvatar(
                          radius: 22,
                          backgroundColor: PRIMARY_COLOR,
                          child: IconButton(
                            color: Colors.white,
                            icon: Icon(CupertinoIcons.photo_camera),
                            onPressed: () {},
                          ),
                        ))
                  ],
                ),
                const SizedBox(height: 10),
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
                  ),
                ),
                const SizedBox(height: 10),
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
                  ),
                ),
                const SizedBox(height: 10),
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
                const SizedBox(height: 10),
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
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: 350,
                  height: 70,
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your date of birth';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.datetime,
                    controller: _dob,
                    style: MAJOR_FONT(
                      textStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    decoration: InputDecoration(
                      labelText: "Date of Birth",
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
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "Gender",
                  style: MAJOR_FONT(
                    textStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: RadioListTile<String>(
                        activeColor: PRIMARY_COLOR,
                        hoverColor: PRIMARY_COLOR,
                        title: Text(
                          'Male',
                          style: MAJOR_FONT(
                            textStyle: const TextStyle(
                              color: Colors.black87,
                              fontSize: 17,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
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
                        title: Text(
                          'Female',
                          style: MAJOR_FONT(
                            textStyle: const TextStyle(
                              color: Colors.black87,
                              fontSize: 17,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
