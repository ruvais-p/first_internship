import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medi/Authentication_pages/login_page.dart';
import 'package:medi/Authentication_pages/signup_page.dart';
import 'package:medi/UI_settings.dart';

class Auth_Directional extends StatelessWidget {
  const Auth_Directional({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: BG_COLOR,
        title: Text(
          " redicine",
          style: GoogleFonts.aBeeZee(
              textStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 35,
                  fontWeight: FontWeight.w600)),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 100,
          ),
          Container(
              width: 390,
              height: 170,
              padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: Text(
                "A Solution to \nensure timely\nmedication.",
                style: GoogleFonts.k2d(
                    textStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 40,
                        fontWeight: FontWeight.w400)),
              )),
          const SizedBox(
            height: 300,
          ),
          Container(
            width: 410,
            height: 130,
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Signup_Page()),
                    );
                  },
                  child: Container(
                    height: 60,
                    child: Center(
                      child: Text(
                        "SIGN UP",
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
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Login_Page()),
                    );
                  },
                  child: Container(
                    child: Center(
                      child: Text(
                        "LOG IN",
                        style: GoogleFonts.mPlus2(
                            textStyle: TextStyle(
                                color: Colors.black87,
                                fontSize: 20,
                                fontWeight: FontWeight.w600)),
                      ),
                    ),
                    height: 60,
                    decoration: BoxDecoration(
                      color: BG_COLOR_SUPPORT,
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Having any trouble? ",
                style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.w300)),
              ),
              GestureDetector(
                  onTap: () {},
                  child: Text(
                    "Help",
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            fontWeight: FontWeight.w500)),
                  ))
            ],
          )
        ],
      ),
    );
  }
}
