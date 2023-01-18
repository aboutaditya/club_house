import 'package:club_house/pages/club.dart';
import 'package:club_house/pages/hackathon.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Signuplogin.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2,
      child: Drawer(
        backgroundColor: Color.fromARGB(205, 0, 0, 0),
        child: menu(),
      ),
    );
  }
}

class menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Expanded(
          child: Column(children: [
            Icon(
              Icons.account_circle,
              color: Colors.white,
              size: 62,
            ),
            Text(
              FirebaseAuth.instance.currentUser!.email.toString(),
              style: TextStyle(color: Colors.white,fontSize: 11),
            )
          ]),
        ),
        const SizedBox(
          height: 30,
        ),
        TextButton(
          onPressed: (() {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => ClubEvent()));
          }),
          child: Text(
            'Club Events',
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
            ),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        TextButton(
          onPressed: (() {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Hackathon()));
          }),
          child: Text(
            'Hackathons',
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
            ),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        TextButton(
            onPressed: (() {}),
            child: Text(
              'Dev Events',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
              ),
            )),
        const SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
                onTap: (() {
                  _signOut();
                  Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginPage()));
                }),
                child: Row(
                  children: [
                    Icon(Icons.logout),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      'Log Out',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                      ),
                    ),
                  ],
                )),
          ],
        ),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }
}

void _signOut() async {
  await FirebaseAuth.instance.signOut();
  print("User signed out");
}
