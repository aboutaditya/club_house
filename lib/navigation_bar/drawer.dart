import 'package:club_house/pages/club.dart';
import 'package:club_house/pages/hackathon.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
      ],
    );
  }
}
