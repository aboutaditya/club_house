import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:club_house/firebase/firecontroller.dart';
import 'package:club_house/landingpage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:particles_flutter/particles_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../contactus.dart';
import 'hackathon.dart';

class ClubEvent extends StatelessWidget {
  const ClubEvent({super.key});

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   body: Container(
    //     child: Column(
    //       children: [SizedBox(), NavBar(), ClubData()],
    //     ),
    //   ),
    // );
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 1300) {
          return Scaffold(
            body: Container(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      color: Colors.white,
                      height: MediaQuery.of(context).size.height / 3,
                      width: MediaQuery.of(context).size.width,
                      child: Stack(children: [
                        // Particles(71, Colors.black54),
                        CircularParticle(
                          key: UniqueKey(),
                          awayRadius: 80,
                          numberOfParticles: 100,
                          speedOfParticles: 1,
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
                          onTapAnimation: true,

                          particleColor: Colors.white.withAlpha(150),
                          awayAnimationDuration: Duration(milliseconds: 600),
                          maxParticleSize: 13,
                          isRandSize: true,
                          isRandomColor: true,
                          randColorList: [
                            Colors.red.withAlpha(210),
                            // Colors.blue.withAlpha(210),
                            // Colors.yellow.withAlpha(210),
                            Colors.black.withAlpha(210)
                          ],
                          awayAnimationCurve: Curves.easeInOutBack,
                          enableHover: true,
                          hoverColor: Colors.white,
                          hoverRadius: 90,
                          connectDots: false, //not recommended
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height / 3,
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: 100,
                                width: MediaQuery.of(context).size.width,
                                child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 147, right: 147),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('CLUBHOUSE',
                                              style: GoogleFonts.poppins(
                                                  fontSize: 36,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w900)),
                                          Container(
                                            width: 600,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                MouseRegion(
                                                  cursor:
                                                      SystemMouseCursors.click,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  LandingPage()));
                                                    },
                                                    child: Text(
                                                      'Home',
                                                      style: GoogleFonts.lato(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 22,
                                                          color: Colors.black),
                                                    ),
                                                  ),
                                                ),
                                                MouseRegion(
                                                  cursor:
                                                      SystemMouseCursors.click,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  ClubEvent()));
                                                    },
                                                    child: Text('Events',
                                                        style: GoogleFonts.lato(
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize: 22,
                                                            color:
                                                                Colors.black)),
                                                  ),
                                                ),
                                                MouseRegion(
                                                  cursor:
                                                      SystemMouseCursors.click,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  Hackathon()));
                                                    },
                                                    child: Text('Hackathons',
                                                        style: GoogleFonts.lato(
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize: 22,
                                                            color:
                                                                Colors.black)),
                                                  ),
                                                ),
                                                MouseRegion(
                                                  cursor:
                                                      SystemMouseCursors.click,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  ContactUs()));
                                                    },
                                                    child: Text('Contact Us',
                                                        style: GoogleFonts.lato(
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize: 22,
                                                            color:
                                                                Colors.black)),
                                                  ),
                                                ),
                                                // MouseRegion(
                                                //   cursor:
                                                //       SystemMouseCursors.click,
                                                //   child: Icon(
                                                //     Icons.account_circle,
                                                //     size: 40,
                                                //     color: Colors.blue,
                                                //   ),
                                                // ),
                                              ],
                                            ),
                                          )
                                        ])),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text('CLUB EVENTS',
                                  style: GoogleFonts.montserrat(
                                      decorationColor: Colors.black,
                                      decorationThickness: 3,
                                      color: Colors.lightBlue,
                                      fontWeight: FontWeight.w900,
                                      // foreground: Paint()..color=Colors.black..strokeWidth=10..style=PaintingStyle.stroke,

                                      fontSize: 50)),
                            ],
                          ),
                        )
                      ]),
                    ),
                    // SizedBox(
                    //   height: 10,
                    // ),
                    // NavBar(),
                    ClubData(
                      qty: 4,
                      height: 1.16,
                    )
                    // ClubData(
                    //   qty: 1,
                    //   height: 1.25,
                    // )
                  ],
                ),
              ),
            ),
          );
        } else if (constraints.maxWidth <= 1300 && constraints.maxWidth > 900) {
          return Scaffold(
            body: Container(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      color: Colors.white,
                      height: MediaQuery.of(context).size.height / 3,
                      width: MediaQuery.of(context).size.width,
                      child: Stack(children: [
                        // Particles(71, Colors.black54),
                        CircularParticle(
                          key: UniqueKey(),
                          awayRadius: 80,
                          numberOfParticles: 100,
                          speedOfParticles: 1,
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
                          onTapAnimation: true,

                          particleColor: Colors.white.withAlpha(150),
                          awayAnimationDuration: Duration(milliseconds: 600),
                          maxParticleSize: 13,
                          isRandSize: true,
                          isRandomColor: true,
                          randColorList: [
                            Colors.red.withAlpha(210),
                            // Colors.blue.withAlpha(210),
                            // Colors.yellow.withAlpha(210),
                            Colors.black.withAlpha(210)
                          ],
                          awayAnimationCurve: Curves.easeInOutBack,
                          enableHover: true,
                          hoverColor: Colors.white,
                          hoverRadius: 90,
                          connectDots: false, //not recommended
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height / 3,
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: 100,
                                width: MediaQuery.of(context).size.width,
                                child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 47, right: 47),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('CLUBHOUSE',
                                              style: GoogleFonts.poppins(
                                                  fontSize: 36,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w900)),
                                          Container(
                                            width: 600,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                MouseRegion(
                                                  cursor:
                                                      SystemMouseCursors.click,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  LandingPage()));
                                                    },
                                                    child: Text(
                                                      'Home',
                                                      style: GoogleFonts.lato(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 22,
                                                          color: Colors.black),
                                                    ),
                                                  ),
                                                ),
                                                MouseRegion(
                                                  cursor:
                                                      SystemMouseCursors.click,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  ClubEvent()));
                                                    },
                                                    child: Text('Events',
                                                        style: GoogleFonts.lato(
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize: 22,
                                                            color:
                                                                Colors.black)),
                                                  ),
                                                ),
                                                MouseRegion(
                                                  cursor:
                                                      SystemMouseCursors.click,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  Hackathon()));
                                                    },
                                                    child: Text('Hackathons',
                                                        style: GoogleFonts.lato(
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize: 22,
                                                            color:
                                                                Colors.black)),
                                                  ),
                                                ),
                                                MouseRegion(
                                                  cursor:
                                                      SystemMouseCursors.click,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  ContactUs()));
                                                    },
                                                    child: Text('Contact Us',
                                                        style: GoogleFonts.lato(
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize: 22,
                                                            color:
                                                                Colors.black)),
                                                  ),
                                                ),
                                                // MouseRegion(
                                                //   cursor:
                                                //       SystemMouseCursors.click,
                                                //   child: Icon(
                                                //     Icons.account_circle,
                                                //     size: 40,
                                                //     color: Colors.blue,
                                                //   ),
                                                // ),
                                              ],
                                            ),
                                          )
                                        ])),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text('CLUB EVENTS',
                                  style: GoogleFonts.montserrat(
                                      decorationColor: Colors.black,
                                      decorationThickness: 3,
                                      color: Colors.lightBlue,
                                      fontWeight: FontWeight.w900,
                                      // foreground: Paint()..color=Colors.black..strokeWidth=10..style=PaintingStyle.stroke,

                                      fontSize: 50)),
                            ],
                          ),
                        )
                      ]),
                    ),
                    // SizedBox(
                    //   height: 10,
                    // ),
                    // NavBar(),
                    ClubData(
                      height: 1.16,
                      qty: 3,
                    )
                  ],
                ),
              ),
            ),
          );
        } else if (constraints.maxWidth <= 900 && constraints.maxWidth > 700) {
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Colors.black,
              centerTitle: true,
              title: Text('CLUB EVENTS',
                  style: GoogleFonts.poppins(
                      fontSize: 31,
                      color: Colors.white,
                      fontWeight: FontWeight.w900)),
            ),
            body: Container(
              height: MediaQuery.of(context).size.height * 2,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // SizedBox(
                    //   height: 10,
                    // ),
                    // NavBar(),
                    ClubData(
                      qty: 2,
                      height: 1.2,
                    )
                  ],
                ),
              ),
            ),
          );
        } else {
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Colors.black,
              centerTitle: true,
              title: Text('CLUB EVENTS',
                  style: GoogleFonts.poppins(
                      fontSize: 31,
                      color: Colors.white,
                      fontWeight: FontWeight.w900)),
            ),
            backgroundColor: Colors.white,
            body: Container(
              height: MediaQuery.of(context).size.height * 2,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // SizedBox(),
                    // NavBar(),
                    ClubData(
                      qty: 1,
                      height: 1.07,
                    )
                  ],
                ),
              ),
            ),
          );
        }
      },
    );
  }
}

class ClubData extends StatefulWidget {
  ClubData({super.key, required this.qty, required this.height});
  int qty;
  double height;

  @override
  State<ClubData> createState() => _ClubDataState();
}

class _ClubDataState extends State<ClubData> {
  Color bg = Colors.white;

  launchURL(String url) async {
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Stream<List<ClubEv>> readClub() => FirebaseFirestore.instance
      .collection('Club Events')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => ClubEv.fromJson(doc.data())).toList());
  var ClubElements = [
    [
      'assets/images/Technama.png',
      'Tech Naama',
      'BIT BY BIT',
      'Saturday, 26 November,2022',
      'https://www.instagram.com/p/CiHePkZp0rj/?utm_source=ig_web_copy_link'
    ],
    [
      'assets/images/techmilaap.png',
      'Tech Milaap',
      'BIT BY BIT',
      'Saturday, 3rd December, 2022',
      'https://www.instagram.com/p/ClmDRJ7Ixqk/?utm_source=ig_web_copy_link'
    ],
    [
      'assets/images/winterfest.png',
      'WINTERFEST\'22',
      'GDSC',
      '27th - 30th December, 2022',
      'https://www.instagram.com/p/CmgsDavvmrt/?utm_source=ig_web_button_share_sheet'
    ],
    [
      'assets/images/datalize.png',
      'DATALIZE',
      'Data Science Club',
      '27th December, 2022',
      'https://www.instagram.com/p/CmjkvgsI9Y2/?utm_source=ig_web_copy_link'
    ],
    [
      'assets/images/hackatown.png',
      'Hack - A - Town',
      'Mozilla ',
      '2nd September, 2022',
      'https://www.instagram.com/p/Ch_q1N5pOHk/?utm_source=ig_web_copy_link'
    ],
  ];
  Stream<QuerySnapshot> getDataStream() {
    return FirebaseFirestore.instance.collection("Club Events").snapshots();
  }

  @override
  Widget build(BuildContext context) {
    // if(media)
    bool ishover = false;
    return Container(
      // color: Colors.white24
      decoration: BoxDecoration(color: Colors.white
          // image: DecorationImage(
          //     image: AssetImage('assets/images/Clubbg.png'), fit: BoxFit.fill)
          ),
      height: MediaQuery.of(context).size.height,
      // height: ,
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 17),
        child: StreamBuilder(
            stream: getDataStream(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              List<DocumentSnapshot> documents = snapshot.data!.docs;
              return GridView.count(
                  // Desktop-1.25 max all
                  // Mobile-1.07-- max 430
                  childAspectRatio: widget.height,
                  crossAxisCount: widget.qty,
                  children: List.generate(
                    documents.length,
                    (index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: PhysicalModel(
                          color: Colors.black,
                          elevation: 8.0,
                          borderRadius: BorderRadius.circular(13),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(13),
                                border: Border.all(color: Colors.black),
                                color: Colors.white
                                // gradient: LinearGradient(
                                //     begin: Alignment.topLeft,
                                //     end: Alignment.bottomRight,
                                //     colors: [
                                //       HexColor('FDFCFB'),
                                //       HexColor('E2D1C3')
                                //     ])
                                ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 13, left: 17, right: 17),
                                  child: Container(
                                    height:
                                        MediaQuery.of(context).size.height / 5,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(17),
                                        image: DecorationImage(
                                            image: NetworkImage(
                                              documents[index]['banner'],
                                            ),
                                            fit: BoxFit.fill)),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 22, top: 13),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        documents[index]['name'],
                                        style: GoogleFonts.poppins(
                                            color: Colors.black,
                                            fontSize: 26,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 10),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: Colors.black12,
                                              borderRadius:
                                                  BorderRadius.circular(13)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(5),
                                            child: Text(
                                              documents[index]['cname'],
                                              style: GoogleFonts.poppins(
                                                  color: Colors.black),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 4, top: 8, right: 4),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8),
                                          child: Text(
                                            documents[index]['Date'],
                                            style: GoogleFonts.poppins(
                                                color: Colors.black87,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                      ),
                                      Material(
                                        color: Colors.transparent,
                                        child: InkWell(
                                          onTap: () {
                                            launchUrlString(
                                                documents[index]['link']);
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: Colors.black12,
                                                borderRadius:
                                                    BorderRadius.circular(12)),
                                            child: Padding(
                                              padding: const EdgeInsets.all(5),
                                              child: Text(
                                                'Register Now',
                                                style: TextStyle(
                                                    color: Colors.black),
                                              ),
                                            ),
                                          ),
                                          onHover: (val) {
                                            setState(() {
                                              ishover = val;
                                            });
                                          },
                                          // hoverColor: Colors.black,
                                          // onHover: (value) {
                                          //   setState(() {
                                          //     ishover = value;
                                          //   });
                                          //   // });
                                          // },
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ));
            }),
      ),
    );
  }
}
