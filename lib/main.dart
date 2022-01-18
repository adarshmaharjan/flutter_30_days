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
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
        "/": (context) => const LoginPage(),
        MyRoutes.homeRoute: (context) => const HomePage(),
        MyRoutes.loginRoute: (context) => const LoginPage(),
      },
    );
  }

  // bringVeg({required bool thaila, int rupess = 100}) {}
}
