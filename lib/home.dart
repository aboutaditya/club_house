import 'package:club_house/contactmobile.dart';
import 'package:club_house/contactus.dart';
import 'package:club_house/mobilelanding.dart';
import 'package:club_house/pages/club.dart';
import 'package:club_house/pages/hackathon.dart';
import 'package:club_house/profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
// import 'globals.dart' as globals;
import 'Signup.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

// class PageOn {
//   dynamic selectedPage = 0;
// }

class _HomeState extends State<Home> {
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

  int selectedPage = 0;
  final List<Widget> _pages = [
    MobilePage(),
    ClubEvent(),
    Hackathon(),
    MobileContact()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _pages[selectedPage],
        bottomNavigationBar: Container(
            color: Colors.black,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: GNav(
                  onTabChange: (index) {
                    setState(() {
                      selectedPage = index;
                    });
                  },
                  gap: 8,
                  backgroundColor: Colors.black,
                  color: Colors.white,
                  tabBackgroundColor: Colors.grey.shade800,
                  padding: EdgeInsets.all(16),
                  activeColor: Colors.white,
                  tabs: [
                    GButton(
                      icon: FontAwesomeIcons.house,
                      text: 'Home',
                    ),
                    GButton(
                      icon: FontAwesomeIcons.code,
                      text: 'Coding Events',
                    ),
                    GButton(
                      icon: FontAwesomeIcons.hackerrank,
                      text: 'Hackathons',
                    ),
                    GButton(
                      icon: FontAwesomeIcons.addressCard,
                      text: 'Contact',
                    )
                  ]),
            )));
  }
}
