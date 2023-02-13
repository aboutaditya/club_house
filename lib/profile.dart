import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          'PROFILE',
          style: GoogleFonts.poppins(
              fontSize: 31, color: Colors.white, fontWeight: FontWeight.w900),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.08,
            ),
            Icon(
              FontAwesomeIcons.user,
              size: 50,
              color: Colors.black,
            ),
            SizedBox(
              height: 35,
            ),
            Column(
              children: [
                Text("ABOUT",
                    style: GoogleFonts.poppins(
                        fontSize: 22,
                        color: Colors.black,
                        fontWeight: FontWeight.w900)),
                Text('CONTACT US',
                    style: GoogleFonts.poppins(
                        fontSize: 22,
                        color: Colors.black,
                        fontWeight: FontWeight.w900))
              ],
            )
            // CircleAvatar(
            //   child: Image.network(
            //     (FirebaseAuth.instance.currentUser?.photoURL).toString(),
            //     fit: BoxFit.fill,
            //   ),
            //   radius: 24,
            // )
          ],
        ),
      ),
    );
  }
}
