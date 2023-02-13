import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:club_house/Signup.dart';
import 'package:club_house/home.dart';
import 'package:club_house/pages/club.dart';
import 'package:club_house/pages/hackathon.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:particles_flutter/particles_flutter.dart';
import 'package:url_launcher/url_launcher_string.dart';

import 'main.dart';

class MobilePage extends StatefulWidget {
  const MobilePage({super.key});

  @override
  State<MobilePage> createState() => _MobilePageState();
}

class _MobilePageState extends State<MobilePage> {
  final dataKey = new GlobalKey();
  final dataKey2 = new GlobalKey();
  // List<BottomNavigationBarItem> buildBottomNavBarItems() {
  //   return [
  //     BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
  //     BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
  //     //BottomNavigationBarItem(icon: Image.asset("assets/images/add.png", height: 35,), label: "Add"),
  //     BottomNavigationBarItem(
  //         icon: Icon(Icons.notifications_none), label: "Listings"),
  //     BottomNavigationBarItem(icon: Icon(Icons.email_outlined), label: "Chat"),
  //   ];
  // }
  // List<IconData> iconList = [
  //   Icons.home,
  //   Icons.search,
  //   Icons.notifications_none,
  //   Icons.email_outlined
  // ];
  final List<Widget> _pages = [
    MobilePage(),
    ClubEvent(),
    Hackathon(),
    SignupPage()
  ];
  Stream<QuerySnapshot> getDataStream() {
    return FirebaseFirestore.instance.collection("Club Events").snapshots();
  }

  Stream<QuerySnapshot> getHackathons() {
    return FirebaseFirestore.instance.collection("Hackathon").snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
         automaticallyImplyLeading: false,
        title: Text('CLUBHOUSE',
            style: GoogleFonts.poppins(
                fontSize: 31,
                color: Colors.white,
                fontWeight: FontWeight.w900)),
      ),
      // bottomNavigationBar: Container(
      //   color: Colors.black,
      //   child: Padding(
      //     padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      //     child: GNav(
      //         gap: 8,
      //         backgroundColor: Colors.black,
      //         color: Colors.white,
      //         tabBackgroundColor: Colors.grey.shade800,
      //         padding: EdgeInsets.all(16),
      //         activeColor: Colors.white,
      //         tabs: [
      //           GButton(
      //             icon: FontAwesomeIcons.house,
      //             text: 'Home',
      //           ),
      //           GButton(
      //             icon: FontAwesomeIcons.code,
      //             text: 'Coding Events',
      //           ),
      //           GButton(
      //             icon: FontAwesomeIcons.hackerrank,
      //             text: 'Hackathons',
      //           ),
      //           GButton(
      //             icon: FontAwesomeIcons.bars,
      //             text: 'Setting',
      //           )
      //         ]),
      //   ),
      // ),
      // bottomNavigationBar: AnimatedBottomNavigationBar(
      //   activeIndex: bottomSelectedIndex,
      //   onTap: (index) {
      //     bottomTapped(index);
      //   },
      //   splashRadius: 0,
      //   inactiveColor: Colors.black,
      //   activeColor: Color(0xFFEE9B1F),
      //   backgroundColor: Colors.white,
      //   icons: iconList,
      //   gapLocation: GapLocation.center,
      //   notchSmoothness: NotchSmoothness.verySmoothEdge,
      //   splashSpeedInMilliseconds: 0,
      // ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Container(
            child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Colors.white,
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width,
                child: Stack(children: [
                  // Particles(71, Colors.black54),
                  CircularParticle(
                    key: UniqueKey(),
                    awayRadius: 80,
                    numberOfParticles: 20,
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
                    height: MediaQuery.of(context).size.height / 2,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        // Container(
                        //   height: 100,
                        //   width: MediaQuery.of(context).size.width,
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.center,
                        //     children: [
                        //       Text('CLUBHOUSE',
                        //           style: GoogleFonts.poppins(
                        //               fontSize: 36,
                        //               color: Colors.black,
                        //               fontWeight: FontWeight.w900)),
                        //       // Container(
                        //       //   width: 600,
                        //       //   child: Row(
                        //       //     mainAxisAlignment:
                        //       //         MainAxisAlignment.spaceBetween,
                        //       //     children: [
                        //       //       Text(
                        //       //         'About',
                        //       //         style: GoogleFonts.lato(
                        //       //             fontWeight: FontWeight.w600,
                        //       //             fontSize: 22,
                        //       //             color: Colors.black),
                        //       //       ),
                        //       //       Text('Events',
                        //       //           style: GoogleFonts.lato(
                        //       //               fontWeight: FontWeight.w600,
                        //       //               fontSize: 22,
                        //       //               color: Colors.black)),
                        //       //       GestureDetector(
                        //       //         onTap: () {
                        //       //     //       Scrollable.ensureVisible(
                        //       //     // dataKey2.currentContext!);
                        //       //         },
                        //       //         child: Text('Hackathons',
                        //       //             style: GoogleFonts.lato(
                        //       //                 fontWeight: FontWeight.w600,
                        //       //                 fontSize: 22,
                        //       //                 color: Colors.black)),
                        //       //       ),
                        //       //       Text('Contact Us',
                        //       //           style: GoogleFonts.lato(
                        //       //               fontWeight: FontWeight.w600,
                        //       //               fontSize: 22,
                        //       //               color: Colors.black)),
                        //       //       Icon(
                        //       //         Icons.account_circle,
                        //       //         size: 40,
                        //       //         color: Colors.blue,
                        //       //       ),
                        //       //     ],
                        //       //   ),
                        //       // ),
                        //     ],
                        //   ),
                        // ),
                        SizedBox(
                          height: 100,
                        ),
                        Column(
                          children: [
                            SizedBox(
                                height: 60,
                                // width: MediaQuery.of(context).size.width,
                                child: DefaultTextStyle(
                                    style: GoogleFonts.montserrat(
                                        decorationColor: Colors.black,
                                        decorationThickness: 3,
                                        color: Colors.lightBlue,
                                        fontWeight: FontWeight.w900,
                                        // foreground: Paint()..color=Colors.black..strokeWidth=10..style=PaintingStyle.stroke,

                                        fontSize: 20),
                                    child: AnimatedTextKit(
                                        pause: const Duration(milliseconds: 1),
                                        repeatForever: true,
                                        animatedTexts: [
                                          WavyAnimatedText(
                                              'GET UPDATES OF LATEST '),
                                          WavyAnimatedText(
                                              'ALWAYS STAY UPDATED ABOUT')
                                        ]))),
                            SizedBox(
                              height: 13,
                            ),
                            SizedBox(
                              height: 50,
                              child: DefaultTextStyle(
                                style: GoogleFonts.montserrat(
                                    color: Colors.lightBlue,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 22),
                                child: AnimatedTextKit(
                                    repeatForever: true,
                                    animatedTexts: [
                                      TypewriterAnimatedText('HACKATHONS'),
                                      TypewriterAnimatedText('CLUB EVENTS')
                                    ]),
                              ),
                            ),
                            SizedBox(
                              height: 26,
                            ),
                            GestureDetector(
                              onTap: () {
                                Scrollable.ensureVisible(
                                    dataKey.currentContext!);
                              },
                              child: Container(
                                width: 170,
                                decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(12)),
                                child: Padding(
                                  padding: const EdgeInsets.all(13),
                                  child: Center(
                                    child: Row(
                                      children: [
                                        Icon(Icons.expand_circle_down_rounded),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          'EXPLORE',
                                          style: GoogleFonts.poppins(
                                              fontSize: 17,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w900),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ]),
              ),
              Container(
                key: dataKey,
                height: 1200,
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                child: DefaultTabController(
                  length: 2,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 26,
                      ),
                      Container(
                          height: 62,
                          width: MediaQuery.of(context).size.width * 0.95,
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(13)),
                          child: TabBar(
                              labelColor: Colors.white,
                              unselectedLabelColor: Colors.white70,
                              tabs: [
                                Text(
                                  'CLUB EVENTS',
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text('HACKATHONS',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold))
                              ])),
                      Container(
                        height: 1000,
                        child: TabBarView(
                          children: [
                            StreamBuilder(
                                stream: getDataStream(),
                                builder: (context, snapshot) {
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: Container(
                                        height: 50,
                                        width: 50,
                                        child: CircularProgressIndicator(
                                          color: Colors.black,
                                        ),
                                      ),
                                    );
                                  }
                                  List<DocumentSnapshot> documents =
                                      snapshot.data!.docs;
                                  return Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      ClubContainer(
                                          club: documents[0]['cname'],
                                          date: documents[0]['Date'],
                                          image: documents[0]['banner'],
                                          link: documents[0]['link'],
                                          name: documents[0]['name']),
                                      ClubContainer(
                                          club: documents[1]['cname'],
                                          date: documents[1]['Date'],
                                          image: documents[1]['banner'],
                                          link: documents[1]['link'],
                                          name: documents[1]['name']),
                                      ClubContainer(
                                          club: documents[2]['cname'],
                                          date: documents[2]['Date'],
                                          image: documents[2]['banner'],
                                          link: documents[2]['link'],
                                          name: documents[2]['name']),
                                      // GestureDetector(
                                      //   onTap: () {
                                      //     // setState(() {
                                      //     //   PageOn().selectedPage = 1;
                                      //     // });
                                          
                                      //     // Navigator.push(
                                      //     //     context,
                                      //     //     MaterialPageRoute(
                                      //     //         builder: (context) =>
                                      //     //             ClubEvent()));
                                      //   },
                                      //   child: Container(
                                      //     decoration: BoxDecoration(
                                      //         color: Colors.blue,
                                      //         borderRadius:
                                      //             BorderRadius.circular(12)),
                                      //     child: Padding(
                                      //       padding: const EdgeInsets.all(8.0),
                                      //       child: Container(
                                      //         width: 150,
                                      //         child: Row(
                                      //           mainAxisAlignment:
                                      //               MainAxisAlignment.center,
                                      //           children: [
                                      //             Icon(
                                      //               Icons.more,
                                      //               color: Colors.white,
                                      //             ),
                                      //             SizedBox(
                                      //               width: 8,
                                      //             ),
                                      //             Text(
                                      //               "View All",
                                      //               style: TextStyle(
                                      //                   color: Colors.white,
                                      //                   fontSize: 26),
                                      //             ),
                                      //           ],
                                      //         ),
                                      //       ),
                                      //     ),
                                      //   ),
                                      // )
                                    ],
                                  );
                                }),
                            StreamBuilder(
                                stream: getHackathons(),
                                builder: (context, snapshot) {
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: Container(
                                        height: 50,
                                        width: 50,
                                        child: CircularProgressIndicator(
                                          color: Colors.black,
                                        ),
                                      ),
                                    );
                                  }
                                  List<DocumentSnapshot> documents =
                                      snapshot.data!.docs;
                                  return Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      ClubContainer(
                                          club: documents[0]['comp'],
                                          date: documents[0]['date'],
                                          image: documents[0]['banner'],
                                          link: documents[0]['link'],
                                          name: documents[0]['name']),
                                      ClubContainer(
                                          club: documents[1]['comp'],
                                          date: documents[1]['date'],
                                          image: documents[1]['banner'],
                                          link: documents[1]['link'],
                                          name: documents[1]['name']),
                                      ClubContainer(
                                          club: documents[2]['comp'],
                                          date: documents[2]['date'],
                                          image: documents[2]['banner'],
                                          link: documents[2]['link'],
                                          name: documents[2]['name']),
                                      // GestureDetector(
                                      //   onTap: () {
                                      //     Navigator.push(
                                      //         context,
                                      //         MaterialPageRoute(
                                      //             builder: (context) =>
                                      //                 Hackathon()));
                                      //   },
                                      //   child: Container(
                                      //     decoration: BoxDecoration(
                                      //         color: Colors.blue,
                                      //         borderRadius:
                                      //             BorderRadius.circular(12)),
                                      //     child: Padding(
                                      //       padding: const EdgeInsets.all(8.0),
                                      //       child: Container(
                                      //         width: 150,
                                      //         child: Row(
                                      //           mainAxisAlignment:
                                      //               MainAxisAlignment.center,
                                      //           children: [
                                      //             Icon(
                                      //               Icons.more,
                                      //               color: Colors.white,
                                      //             ),
                                      //             SizedBox(
                                      //               width: 8,
                                      //             ),
                                      //             Text(
                                      //               "View All",
                                      //               style: TextStyle(
                                      //                   color: Colors.white,
                                      //                   fontSize: 26),
                                      //             ),
                                      //           ],
                                      //         ),
                                      //       ),
                                      //     ),
                                      //   ),
                                      // )
                                    ],
                                  );
                                }),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 2,
//       child: Scaffold(
//         backgroundColor: Colors.white,
//         appBar: AppBar(automaticallyImplyLeading: false,
//           backgroundColor: Colors.black,
//           title: Text(
//             'CLUBHOUSE',
//             style: GoogleFonts.poppins(color: Colors.white),
//           ),
//           centerTitle: true,
//         ),
//         endDrawer: MyDrawer(),
//         body: SingleChildScrollView(
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Container(
//                 // color: Colors.amber,
//                 width: MediaQuery.of(context).size.width,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     Padding(
//                       padding:
//                           const EdgeInsets.only(top: 26, left: 44, right: 25),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             'Cant keep track of all the events?',
//                             style: TextStyle(
//                                 fontSize: 40,
//                                 color: Colors.black,
//                                 fontWeight: FontWeight.bold),
//                           ),
//                           Text(
//                             'We Got You!',
//                             style: TextStyle(
//                                 fontSize: 36,
//                                 color: Colors.black,
//                                 fontWeight: FontWeight.bold),
//                           ),
//                           Text(
//                             '<Get updates of all the upcoming club events and major developer hackathons.  />',
//                             style: TextStyle(
//                                 fontSize: 26,
//                                 color: Color.fromRGBO(90, 117, 127, 1)),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Padding(
//                       padding:
//                           const EdgeInsets.only(top: 17, left: 44, right: 25),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.only(right: 20),
//                             child: Container(
//                               decoration: BoxDecoration(
//                                   color: Colors.blue,
//                                   borderRadius: BorderRadius.circular(17)),
//                               height: 44,
//                               width: 130,
//                               child: TextButton(
//                                 onPressed: () {
//                                   Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                           builder: (context) => ClubEvent()));
//                                 },
//                                 child: Text(
//                                   'Club Events',
//                                   style: TextStyle(
//                                       color: Colors.white, fontSize: 17),
//                                 ),
//                               ),
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.only(),
//                             child: Container(
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(17),
//                                 color: Colors.blue,
//                               ),
//                               height: 44,
//                               width: 130,
//                               child: TextButton(
//                                   onPressed: () {
//                                     Navigator.push(
//                                         context,
//                                         MaterialPageRoute(
//                                             builder: (context) => Hackathon()));
//                                   },
//                                   child: Text(
//                                     'Hackathons',
//                                     style: TextStyle(
//                                         color: Colors.white, fontSize: 17),
//                                   )),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Column(
//                 children: [
//                   Image.asset(
//                     // 'assets/images/landingpage.png',
//                     'assets/images/pic.jpg',
//                     width: MediaQuery.of(context).size.width,
//                   ),
//                 ],
//               ),
//               // Hackathon(),
//               SizedBox(
//                 height: 30,
//               ),

//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

class ClubContainer extends StatefulWidget {
  ClubContainer(
      {super.key,
      required this.club,
      required this.date,
      required this.image,
      required this.link,
      required this.name});
  String name, date, club, link, image;

  @override
  State<ClubContainer> createState() => _ClubContainerState();
}

class _ClubContainerState extends State<ClubContainer> {
  bool ishover = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 8, right: 20, bottom: 8),
      child: Container(
        height: 300,
        width: 350,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(13),
            border: Border.all(color: Colors.black)
            // gradient: LinearGradient(
            //     begin: Alignment.topLeft,
            //     end: Alignment.bottomRight,
            //     colors: [HexColor('FDFCFB'), HexColor('E2D1C3')])
            ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 13, left: 17, right: 17),
              child: Container(
                height: MediaQuery.of(context).size.height / 5,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(17),
                    image: DecorationImage(
                        image: NetworkImage(
                          widget.image,
                        ),
                        fit: BoxFit.fill)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 22, top: 13),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.name,
                    style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 26,
                        fontWeight: FontWeight.w600),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(13)),
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Text(
                          widget.club,
                          style: GoogleFonts.poppins(color: Colors.black),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 0, right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        widget.date,
                        style: GoogleFonts.poppins(
                            color: Colors.black87, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        launchUrlString(widget.link);
                      },
                      child: Icon(
                        Icons.link_outlined,
                        color: (ishover) ? Colors.black : Colors.blue,
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
    );
  }
}
