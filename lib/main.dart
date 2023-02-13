import 'package:club_house/Signup.dart';
import 'package:club_house/Signuplogin.dart';
import 'package:club_house/clubinfo.dart';
import 'package:club_house/contactus.dart';
import 'package:club_house/landingpage.dart';

import 'package:club_house/pages/club.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeData _buildTheme(brightness) {
    var baseTheme = ThemeData(brightness: brightness);

    return baseTheme.copyWith(
      textTheme: GoogleFonts.poppinsTextTheme(baseTheme.textTheme),
    );
  }

  bool login = false;
  checkLogin() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        if (mounted) {
          setState(() {
            login = false;
          });
        }
      } else {
        if (mounted) {
          setState(() {
            login = true;
          });
        }
      }
    });
  }

  @override
  void initState() {
    super.initState();
    checkLogin();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: _buildTheme(Brightness.dark),
        debugShowCheckedModeBanner: false,
        home: login ? LandingPage() : SignupPage()
        // home:ClubAdd()
        );
  }
}
// List<BottomNavigationBarItem> buildBottomNavBarItems() {
//     return [
//       BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
//       BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
//       //BottomNavigationBarItem(icon: Image.asset("assets/images/add.png", height: 35,), label: "Add"),
//       BottomNavigationBarItem(
//           icon: Icon(Icons.notifications_none), label: "Listings"),
//       BottomNavigationBarItem(icon: Icon(Icons.email_outlined), label: "Chat"),
//     ];
//   }
//   List<IconData> iconList = [
//     Icons.home,
//     Icons.search,
//     Icons.notifications_none,
//     Icons.email_outlined
//   ];
//   bottomNavigationBar: AnimatedBottomNavigationBar(
//         activeIndex: bottomSelectedIndex,
//         onTap: (index) {
//           bottomTapped(index);
//         },
//         splashRadius: 0,
//         inactiveColor: Colors.black,
//         activeColor: Color(0xFFEE9B1F),
//         backgroundColor: Colors.white,
//         icons: iconList,
//         gapLocation: GapLocation.center,
//         notchSmoothness: NotchSmoothness.verySmoothEdge,
//         splashSpeedInMilliseconds: 0,
//       ),