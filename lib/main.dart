// flutter
import 'package:flutter/material.dart';
// google fonts
import 'package:google_fonts/google_fonts.dart';
// pages
import 'pages/home_page.dart';
// routes
import './utils/routes.dart';
import 'pages/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: HomePage(),
      themeMode: ThemeMode.light,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        fontFamily: GoogleFonts.lato().fontFamily,
        // textTheme: GoogleFonts.latoTextTheme(),
      ),
      darkTheme: ThemeData(
        // brightness: Brightness.dark,
        primarySwatch: Colors.grey,
      ),
      routes: {
        "/": (context) => LoginPage(),
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.loginRoute: (context) => LoginPage(),
      },
    );
  }

  // bringVeg({required bool thaila, int rupess = 100}) {}
}
