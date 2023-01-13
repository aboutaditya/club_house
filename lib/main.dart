import 'package:club_house/landingpage.dart';
import 'package:club_house/navigation_bar/drawer.dart';
import 'package:club_house/navigation_bar/top_navigation.dart';
import 'package:club_house/pages/club.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  ThemeData _buildTheme(brightness) {
    var baseTheme = ThemeData(brightness: brightness);

    return baseTheme.copyWith(
      textTheme: GoogleFonts.poppinsTextTheme(baseTheme.textTheme),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _buildTheme(Brightness.dark),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(),
                NavBar(),
                LandingPage(),
              ],
            ),
          ),
          endDrawer: MyDrawer(),
          endDrawerEnableOpenDragGesture: false,
          ),
    );
  }
}
