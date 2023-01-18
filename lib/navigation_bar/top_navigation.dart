import 'package:club_house/Signuplogin.dart';
import 'package:club_house/landingpage.dart';
import 'package:club_house/main.dart';
import 'package:club_house/pages/club.dart';
import 'package:club_house/pages/hackathon.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > 730) {
        return DesktopNavBar(height: height);
      } else {
        return MobileNavBar(height: height);
      }
    });
  }
}

class DesktopNavBar extends StatelessWidget {
  const DesktopNavBar({
    Key? key,
    required this.height,
  }) : super(key: key);

  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height / 11.5,
      color: Color.fromRGBO(37, 37, 37, 1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 35),
            child: GestureDetector(
              onTap: (() {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => MyApp()));
              }),
              child: Container(
                child: Text(
                  'CLUBHOUSE',
                  style: TextStyle(
                      fontSize: 35,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Row(
              children: [
                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: GestureDetector(
                //     onTap: (() {
                //       Navigator.push(context,
                //           MaterialPageRoute(builder: (context) => ClubEvent()));
                //     }),
                //     child: Text(
                //       'Club Events',
                //       style: TextStyle(
                //         color: Colors.white,
                //         fontSize: 22,
                //       ),
                //     ),
                //   ),
                // ),
                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: GestureDetector(
                //     onTap: () {
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => Hackathon()));
                //     },
                //     child: Text(
                //       'Hackathons',
                //       style: TextStyle(
                //         color: Colors.white,
                //         fontSize: 22,
                //       ),
                //     ),
                //   ),
                // ),
                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: Text(
                //     'Dev Events',
                //     style: TextStyle(
                //       color: Colors.white,
                //       fontSize: 22,
                //     ),
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.all(6),
                      child: Row(
                        children: [
                          Icon(
                            Icons.account_circle_outlined,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            FirebaseAuth.instance.currentUser!.email.toString(),
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            height: 50,
                            width: 2,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              _signOut();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginPage()));
                            },
                            child: Row(
                              children: [
                                Icon(
                                  Icons.logout,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'LOG OUT',
                                  style: TextStyle(
                                    color: Colors.white,
                                    // fontSize: 17,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.all(6.0),
                //   child:
                // )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class MobileNavBar extends StatelessWidget {
  const MobileNavBar({
    Key? key,
    required this.height,
  }) : super(key: key);

  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height / 11.5,
      color: Color.fromRGBO(37, 37, 37, 1),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Padding(
          padding: const EdgeInsets.only(left: 35),
          child: GestureDetector(
            onTap: (() {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => MyApp()));
            }),
            child: Container(
              child: Text(
                'CLUBHOUSE',
                style: TextStyle(
                    fontSize: 35,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            right: 8,
          ),
          child: IconButton(
            icon: const Icon(
              Icons.menu,
              color: Colors.white,
            ),
            onPressed: (() async {
              Scaffold.of(context).openEndDrawer();
            }),
          ),
        ),
      ]),
    );
  }
}

void _signOut() async {
  await FirebaseAuth.instance.signOut();
  print("User signed out");
}
