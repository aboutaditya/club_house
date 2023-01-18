import 'package:club_house/navigation_bar/drawer.dart';
import 'package:club_house/pages/club.dart';
import 'package:club_house/pages/hackathon.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MobilePage extends StatelessWidget {
  const MobilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            'CLUBHOUSE',
            style: GoogleFonts.poppins(color: Colors.white),
          ),
          centerTitle: true,
        ),
        endDrawer: MyDrawer(),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                // color: Colors.amber,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 26, left: 44, right: 25),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Cant keep track of all the events?',
                            style: TextStyle(
                                fontSize: 40,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'We Got You!',
                            style: TextStyle(
                                fontSize: 36,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '<Get updates of all the upcoming club events and major developer hackathons.  />',
                            style: TextStyle(
                                fontSize: 26,
                                color: Color.fromRGBO(90, 117, 127, 1)),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 17, left: 44, right: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(17)),
                              height: 44,
                              width: 130,
                              child: TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ClubEvent()));
                                },
                                child: Text(
                                  'Club Events',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 17),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(17),
                                color: Colors.blue,
                              ),
                              height: 44,
                              width: 130,
                              child: TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Hackathon()));
                                  },
                                  child: Text(
                                    'Hackathons',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 17),
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Image.asset(
                    // 'assets/images/landingpage.png',
                    'assets/images/pic.jpg',
                    width: MediaQuery.of(context).size.width,
                  ),
                ],
              ),
              // Hackathon(),
              SizedBox(
                height: 30,
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}