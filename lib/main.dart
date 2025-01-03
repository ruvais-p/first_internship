import 'package:flutter/material.dart';
import 'package:medi/Authentication_pages/auth_directional_page.dart';
import 'package:medi/Authentication_pages/nomberverification_page.dart';
import 'package:medi/UI_settings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(
                background: Colors.white,
                surface: Colors.white,
                primary: PRIMARY_COLOR,
                secondary: PRIMARY_COLOR)),
        debugShowCheckedModeBanner: false,
        home: Auth_Directional());
  }
}
