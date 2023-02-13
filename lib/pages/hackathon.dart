import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:club_house/landingpage.dart';
import 'package:club_house/pages/club.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:particles_flutter/particles_flutter.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../contactus.dart';

class Hackathon extends StatelessWidget {
  Hackathon({super.key});

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
                    // SizedBox(),
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
                                                      SystemMouseCursors
                                                          .click,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder:
                                                                  (context) =>
                                                                      LandingPage()));
                                                    },
                                                    child: Text(
                                                      'Home',
                                                      style: GoogleFonts.lato(
                                                          fontWeight:
                                                              FontWeight
                                                                  .w600,
                                                          fontSize: 22,
                                                          color: Colors
                                                              .black),
                                                    ),
                                                  ),
                                                ),
                                                MouseRegion(
                                                  cursor:
                                                      SystemMouseCursors
                                                          .click,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder:
                                                                  (context) =>
                                                                      ClubEvent()));
                                                    },
                                                    child: Text('Events',
                                                        style: GoogleFonts.lato(
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600,
                                                            fontSize: 22,
                                                            color: Colors
                                                                .black)),
                                                  ),
                                                ),
                                                MouseRegion(
                                                  cursor:
                                                      SystemMouseCursors
                                                          .click,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder:
                                                                  (context) =>
                                                                      Hackathon()));
                                                    },
                                                    child: Text(
                                                        'Hackathons',
                                                        style: GoogleFonts.lato(
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600,
                                                            fontSize: 22,
                                                            color: Colors
                                                                .black)),
                                                  ),
                                                ),
                                                MouseRegion(
                                                  cursor:
                                                      SystemMouseCursors
                                                          .click,
                                                  child: GestureDetector(
                                                    onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          ContactUs()));
                                            },
                                                    child: Text(
                                                        'Contact Us',
                                                        style: GoogleFonts.lato(
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600,
                                                            fontSize: 22,
                                                            color: Colors
                                                                .black)),
                                                  ),
                                                ),
                                                // MouseRegion(
                                                //   cursor:
                                                //       SystemMouseCursors
                                                //           .click,
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
                              Text('HACKATHONS',
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
                    // NavBar(),
                    HackathonData(
                      qty: 2,
                      font1: 35,
                      font2: 22,
                      font3: 15,
                      font4: 19,
                      paddingl: 22,
                    )
                  ],
                ),
              ),
            ),
          );
        } else if (constraints.maxWidth <= 1300 && constraints.maxWidth > 960) {
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
                                                        SystemMouseCursors
                                                            .click,
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        LandingPage()));
                                                      },
                                                      child: Text(
                                                        'Home',
                                                        style: GoogleFonts.lato(
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600,
                                                            fontSize: 22,
                                                            color: Colors
                                                                .black),
                                                      ),
                                                    ),
                                                  ),
                                                  MouseRegion(
                                                    cursor:
                                                        SystemMouseCursors
                                                            .click,
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        ClubEvent()));
                                                      },
                                                      child: Text('Events',
                                                          style: GoogleFonts.lato(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontSize: 22,
                                                              color: Colors
                                                                  .black)),
                                                    ),
                                                  ),
                                                  MouseRegion(
                                                    cursor:
                                                        SystemMouseCursors
                                                            .click,
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        Hackathon()));
                                                      },
                                                      child: Text(
                                                          'Hackathons',
                                                          style: GoogleFonts.lato(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontSize: 22,
                                                              color: Colors
                                                                  .black)),
                                                    ),
                                                  ),
                                                  MouseRegion(
                                                    cursor:
                                                        SystemMouseCursors
                                                            .click,
                                                    child: GestureDetector(
                                                      onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            ContactUs()));
                                              },
                                                      child: Text(
                                                          'Contact Us',
                                                          style: GoogleFonts.lato(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontSize: 22,
                                                              color: Colors
                                                                  .black)),
                                                    ),
                                                  ),
                                                  // MouseRegion(
                                                  //   cursor:
                                                  //       SystemMouseCursors
                                                  //           .click,
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
                              Text('Hackathon',
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
                    // SizedBox(),
                    // NavBar(),
                    HackathonData(
                      font1: 24,
                      font2: 19,
                      font3: 13,
                      font4: 15,
                      paddingl: 19,
                      qty: 2,
                    )
                  ],
                ),
              ),
            ),
          );
        } else if (constraints.maxWidth <= 960 && constraints.maxWidth > 730) {
          return Scaffold(
            body: Container(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(),
                    // NavBar(),
                    HackathonData(
                      font1: 35,
                      font2: 22,
                      font3: 12,
                      font4: 13,
                      paddingl: 16,
                      qty: 1,
                    )
                  ],
                ),
              ),
            ),
          );
        } else if (constraints.maxWidth <= 730 && constraints.maxWidth > 430) {
          return Scaffold(
            appBar: AppBar( automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text('HACKATHONS',
            style: GoogleFonts.poppins(
                fontSize: 31,
                color: Colors.white,
                fontWeight: FontWeight.w900)),
      ),
            body: Container(
              height: MediaQuery.of(context).size.height*2,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // SizedBox(),
                    // NavBar(),
                    HackathonData(
                      font1: 25,
                      font2: 20,
                      font3: 13,
                      font4: 13,
                      paddingl: 13,
                      qty: 1,
                    )
                  ],
                ),
              ),
            ),

          );
        } else {
          return Scaffold(
            appBar: AppBar( automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text('HACKATHONS',
            style: GoogleFonts.poppins(
                fontSize: 31,
                color: Colors.white,
                fontWeight: FontWeight.w900)),
      ),
            backgroundColor: Colors.black,
            body: Container(
              height: MediaQuery.of(context).size.height*2,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // SizedBox(),
                    // NavBar(),
                    HackathonData(
                      font1: 18,
                      font2: 15,
                      font3: 7,
                      font4: 10,
                      qty: 1,
                      paddingl: 8,
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

class HackathonData extends StatelessWidget {
  HackathonData(
      {super.key,
      required this.qty,
      required this.font1,
      required this.font2,
      required this.font3,
      required this.font4,
      this.paddingl = 10});

  Color bg = Colors.white;
  int font1;
  int font2;
  int font3;
  int font4;
  double paddingl;
  int qty;
  launchURL(String url) async {
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  var HackData = [
    [
      'Google Summer Of Code',
      'Google',
      'https://summerofcode.withgoogle.com/',
      'Open-Source',
      'Online',
      'Closes on 29-03-2023',
    ],
    [
      'MLH Fellowship',
      'Major League Hackathon',
      'https://fellowship.mlh.io/',
      'Open Source',
      'Online',
      'Closes on 29-03-2023',
    ],
    [
      'G. Script Summer of Code',
      'Girls Script Tech',
      'https://gssoc.girlscript.tech/',
      'Open Source, Women in Tech',
      'Online',
      'Closes on 29-03-2023',
    ],
    [
      'Imagine Cup',
      'Microsoft',
      'https://imaginecup.microsoft.com/en-us/Events',
      'Development Hackathon',
      'Hybrid',
      'Closes on 29-03-2023',
    ],
    [
      'ETH for All',
      'Devfolio',
      'https://ethforall.devfolio.co/',
      'Web-3',
      'Online',
      'Closes on 29-01-2023',
    ],
    [
      'oneAPI',
      'Intel',
      'https://www.hackerearth.com/challenges/hackathon/intel-oneapi-hackathon-for-open-innovation/',
      'Open Innovation',
      'Online',
      'Closes on 31-01-2023',
    ]
  ];

  Stream<QuerySnapshot> getDataStream() {
    return FirebaseFirestore.instance.collection("Hackathon").snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white
          // image: DecorationImage(
          //     image: AssetImage("assets/images/Clubbg.png"), fit: BoxFit.fill)
              ),
      height: MediaQuery.of(context).size.height,
      // height: double.infinity,
      child: StreamBuilder(
        stream: getDataStream(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          List<DocumentSnapshot> documents = snapshot.data!.docs;
          return Padding(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height / 20,
                left: MediaQuery.of(context).size.width / 17,
                right: MediaQuery.of(context).size.width / 17),
            child: GridView.count(
              crossAxisCount: qty,
              childAspectRatio: 2.1,
              // padding: EdgeInsets.all(13),
              children: List.generate(documents.length, (index) {
                return Padding(
                  padding: const EdgeInsets.only(
                      left: 8, right: 8, top: 8, bottom: 5),
                  child: PhysicalModel(
                    color: Colors.black,
        elevation: 8.0,
        borderRadius: BorderRadius.circular(17),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(17),
                          // color: Colors.white
                          border: Border.all(color: Colors.black),
                          color: Colors.white
                          // gradient: LinearGradient(
                          //     begin: Alignment.topLeft,
                          //     end: Alignment.bottomRight,
                          //     colors: [HexColor('FDFCFB'), HexColor('E2D1C3')])
                              ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    left: paddingl, right: 8, top: 12),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AutoSizeText(
                                      documents[index]['name'],
                                      style: TextStyle(
                                          fontSize: font1.toDouble(),
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 4),
                                      child: Text(
                                        documents[index]['comp'],
                                        style: TextStyle(
                                            fontSize: font2.toDouble(),
                                            color: Colors.grey),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              // Padding(
                              //   padding: const EdgeInsets.all(17),
                              //   child: GestureDetector(
                              //     onTap: (() {
                                    
                              //     }),
                              //     child: CircleAvatar(
                              //         backgroundColor:
                              //             Color.fromARGB(255, 245, 247, 247),
                              //         child: Icon(
                              //           Icons.link,
                              //           color: Colors.black,
                              //         )),
                              //   ),
                              // )
                            ],
                          ),
                          Container(
                            child: Padding(
                              padding: EdgeInsets.only(left: paddingl),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text("THEME :",
                                            style: GoogleFonts.poppins(
                                                color: Color.fromARGB(
                                                    255, 116, 116, 116),
                                                fontSize: font1.toDouble() / 2)),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 22),
                                    child: Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              color: Color.fromARGB(
                                                  255, 245, 247, 247),
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(4),
                                            child: Text(
                                              documents[index]['type'],
                                              style: GoogleFonts.poppins(
                                                  color: Colors.black87,
                                                  fontSize: font1.toDouble() / 2),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: paddingl, right: 10, bottom: 4),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 4, left: 0, right: 8),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                            decoration: BoxDecoration(
                                                color: Color.fromARGB(
                                                    255, 245, 247, 247),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: Padding(
                                              padding: const EdgeInsets.all(4.0),
                                              child: Text(
                                                documents[index]['date'],
                                                style: TextStyle(
                                                    color: Colors.black87,
                                                    fontSize: font3.toDouble()),
                                              ),
                                            )),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: Color.fromARGB(
                                                  255, 245, 247, 247),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Text(
                                              documents[index]['mode'],
                                              style: TextStyle(
                                                  color: Colors.black87,
                                                  fontSize: font3.toDouble()),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: MouseRegion(
                                    cursor: SystemMouseCursors.click,
                                    child: GestureDetector(
                                      onTap: () {
                                        launchUrlString(documents[index]['link']);
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.blue[400],
                                            borderRadius: BorderRadius.circular(10)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(5),
                                          child: Text(
                                            'Register Now',
                                            style: TextStyle(
                                                fontSize: font4.toDouble(),
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ),
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
              }),
            ),
          );
        },
      ),
    );
  }
}
