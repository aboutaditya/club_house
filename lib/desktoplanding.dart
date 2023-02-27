import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:club_house/Signup.dart';
import 'package:club_house/clubinfo.dart';
import 'package:club_house/contactus.dart';
import 'package:club_house/landingpage.dart';
import 'package:club_house/main.dart';
import 'package:club_house/pages/club.dart';
import 'package:club_house/pages/hackathon.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:particles_flutter/particles_flutter.dart';
import 'package:url_launcher/url_launcher_string.dart';

// class DesktopPage extends StatelessWidget {
//   const DesktopPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 2,
//       child: Scaffold(
//           backgroundColor: Colors.blue,
//           body: SingleChildScrollView(
//             child: Stack(
//               children: [

//                 Particles(50, Colors.white),
//                 Column(
//                   children: [
//                     NavBar(),
//                     Row(
//                       children: [
//                         Container(
//                           width: MediaQuery.of(context).size.width / 2,
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             children: [
//                               Padding(
//                                 padding: const EdgeInsets.only(
//                                     top: 26, left: 44, right: 25),
//                                 child: Column(
//                                   mainAxisAlignment: MainAxisAlignment.start,
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Text(
//                                       'Never miss an opportunity to grow',
//                                       style: TextStyle(
//                                           fontSize: 40,
//                                           color: Colors.black,
//                                           fontWeight: FontWeight.bold),
//                                     ),
//                                     Text(
//                                       'We Got You!',
//                                       style: TextStyle(
//                                           fontSize: 36,
//                                           color: Colors.black,
//                                           fontWeight: FontWeight.bold),
//                                     ),
//                                     Text(
//                                       '<Get updates of all the upcoming club events and major developer hackathons.>',
//                                       style: TextStyle(
//                                           fontSize: 26,
//                                           color:
//                                               Color.fromRGBO(90, 117, 127, 1)),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.only(
//                                     top: 17, left: 44, right: 25),
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.start,
//                                   children: [
//                                     Padding(
//                                       padding: const EdgeInsets.only(right: 20),
//                                       child: Container(
//                                         decoration: BoxDecoration(
//                                             color: Colors.blue,
//                                             borderRadius:
//                                                 BorderRadius.circular(17)),
//                                         height: 44,
//                                         width: 130,
//                                         child: TextButton(
//                                           onPressed: () {
//                                             Navigator.push(
//                                                 context,
//                                                 MaterialPageRoute(
//                                                     builder: (context) =>
//                                                         ClubEvent()));
//                                           },
//                                           child: Text(
//                                             'Club Events',
//                                             style: TextStyle(
//                                                 color: Colors.white,
//                                                 fontSize: 17),
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                     Padding(
//                                       padding: const EdgeInsets.only(),
//                                       child: Container(
//                                         decoration: BoxDecoration(
//                                           borderRadius:
//                                               BorderRadius.circular(17),
//                                           color: Colors.blue,
//                                         ),
//                                         height: 44,
//                                         width: 130,
//                                         child: TextButton(
//                                             onPressed: () {
//                                               Navigator.push(
//                                                   context,
//                                                   MaterialPageRoute(
//                                                       builder: (context) =>
//                                                           Hackathon()));
//                                             },
//                                             child: Text(
//                                               'Hackathons',
//                                               style: TextStyle(
//                                                   color: Colors.white,
//                                                   fontSize: 17),
//                                             )),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         Column(
//                           children: [
//                             Image.asset('assets/images/pic.jpg',
//                                 width: MediaQuery.of(context).size.width / 2),
//                           ],
//                         )
//                       ],
//                     ),
//                     SizedBox(
//                       height: 30,
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           )),
//     );
//   }
// }
class DesktopPage extends StatefulWidget {
  const DesktopPage({super.key});

  @override
  State<DesktopPage> createState() => _DesktopPageState();
}

class _DesktopPageState extends State<DesktopPage> {
  String typew = '';
  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('ClubAuth');
  bool addcheck = false;

  void getUsersData() {
    collectionReference
        .doc(FirebaseAuth.instance.currentUser!.email!)
        .get()
        .then((value) {
      var fields = value;

      setState(() {
        typew = fields['type'];
        print(typew);
      });
    });
    // addCheck();
  }

  void addCheck() {
    if (typew == 'club') {
      setState(() {
        addcheck = true;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUsersData();
    addCheck();
  }

  final dataKey = new GlobalKey();
  final dataKey2 = new GlobalKey();
  final dataKey3 = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    // getUsersData();
    addCheck();
    print(typew);
    print(addcheck);

    Stream<QuerySnapshot> getDataStream() {
      return FirebaseFirestore.instance.collection("Club Events").snapshots();
    }

    Stream<QuerySnapshot> getHackathons() {
      return FirebaseFirestore.instance.collection("Hackathon").snapshots();
    }

    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Container(
            child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                key: dataKey3,
                color: Colors.white,
                height: MediaQuery.of(context).size.height / 1.3,
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
                    height: MediaQuery.of(context).size.height / 1,
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
                            padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width / 15,
                                right: MediaQuery.of(context).size.width / 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      MouseRegion(
                                        cursor: SystemMouseCursors.click,
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
                                                fontWeight: FontWeight.w600,
                                                fontSize: 22,
                                                color: Colors.black),
                                          ),
                                        ),
                                      ),
                                      MouseRegion(
                                        cursor: SystemMouseCursors.click,
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
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 22,
                                                  color: Colors.black)),
                                        ),
                                      ),
                                      MouseRegion(
                                        cursor: SystemMouseCursors.click,
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
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 22,
                                                  color: Colors.black)),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ContactUs()));
                                        },
                                        child: MouseRegion(
                                          cursor: SystemMouseCursors.click,
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
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 22,
                                                    color: Colors.black)),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
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

                                        fontSize: 50),
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
                              height: 30,
                            ),
                            SizedBox(
                              height: 50,
                              child: DefaultTextStyle(
                                style: GoogleFonts.montserrat(
                                    color: Colors.lightBlue,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 45),
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Scrollable.ensureVisible(
                                        dataKey.currentContext!);
                                  },
                                  child: MouseRegion(
                                    cursor: SystemMouseCursors.click,
                                    child: Container(
                                      width: 170,
                                      decoration: BoxDecoration(
                                          color: Colors.blue,
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(13),
                                        child: Center(
                                          child: Row(
                                            children: [
                                              Icon(Icons
                                                  .expand_circle_down_rounded),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                'EXPLORE',
                                                style: GoogleFonts.poppins(
                                                    fontSize: 22,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.w900),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    // Scrollable.ensureVisible(\v0\b\clubhouse-c0a58.appspot.com\o\Clubhouse.apk
                                    //     dataKey.currentContext!);
                                    launchUrlString('https://firebasestorage.googleapis.com/v0/b/clubhouse-c0a58.appspot.com/o/Clubhouse.apk?alt=media&token=13b39955-62d8-4b05-ab8d-74c2730059ae');
                                  },
                                  child: MouseRegion(
                                    cursor: SystemMouseCursors.click,
                                    child: Container(
                                      width: 230,
                                      decoration: BoxDecoration(
                                          color: Colors.blue,
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(13),
                                        child: Center(
                                          child: Row(
                                            children: [
                                              Icon(
                                                FontAwesomeIcons.android,
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                'Download APK',
                                                style: GoogleFonts.poppins(
                                                    fontSize: 22,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.w900),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
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
                height: 600,
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
                          width: 422,
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
                                      fontSize: 26,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text('HACKATHONS',
                                    style: TextStyle(
                                        fontSize: 26,
                                        fontWeight: FontWeight.bold))
                              ])),
                      Container(
                        height: 400,
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
                                  // return ListView.builder(
                                  //     itemCount: 1,
                                  //     scrollDirection: Axis.horizontal,
                                  //     // Desktop-1.25 max all
                                  //     // Mobile-1.07-- max 430
                                  //     // childAspectRatio: 1.25,
                                  //     // crossAxisCount: 4,
                                  //     itemBuilder: (Builder, context) {
                                  //       return ClubPart();
                                  // return ClubContainer(
                                  //     club: documents[0]['cname'],
                                  //     date: documents[0]['Date'],
                                  //     image: documents[0]['banner'],
                                  //     link: documents[0]['link'],
                                  //     name: documents[0]['name']);
                                  //     });
                                  return Row(
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
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ClubEvent()));
                                        },
                                        child: MouseRegion(
                                          cursor: SystemMouseCursors.click,
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: Colors.blue,
                                                borderRadius:
                                                    BorderRadius.circular(12)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    "View All",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 26),
                                                  ),
                                                  SizedBox(
                                                    width: 8,
                                                  ),
                                                  Icon(
                                                    Icons.more,
                                                    color: Colors.white,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
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
                                  //
                                  return Row(
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
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Hackathon()));
                                        },
                                        child: MouseRegion(
                                          cursor: SystemMouseCursors.click,
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: Colors.blue,
                                                borderRadius:
                                                    BorderRadius.circular(12)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    "View All",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 26),
                                                  ),
                                                  SizedBox(
                                                    width: 8,
                                                  ),
                                                  Icon(
                                                    Icons.more,
                                                    color: Colors.white,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  );
                                  // });
                                }),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                height: 152,
                color: Colors.blue.shade700,
                child: Center(
                    child: Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('CLUBHOUSE',
                          style: GoogleFonts.poppins(
                              fontSize: 44,
                              color: Colors.white,
                              fontWeight: FontWeight.w900)),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              MouseRegion(
                                cursor: SystemMouseCursors.click,
                                child: GestureDetector(
                                  onTap: () {
                                    if (addcheck) {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => ClubAdd()));
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                        backgroundColor:
                                            Color.fromARGB(0, 255, 255, 255),
                                        content: Container(
                                            decoration: BoxDecoration(

                                                // image: DecorationImage(
                                                //     image: AssetImage(
                                                //         'assets/images/signin.png'),
                                                //     fit: BoxFit.fill),
                                                color: Colors.blue,
                                                borderRadius:
                                                    BorderRadius.circular(12)),
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.1,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.6,
                                            child: Center(
                                                child: Text(
                                              'You don\'t have access to this page',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 26,
                                                  fontWeight: FontWeight.bold),
                                            ))),
                                      ));
                                    }
                                  },
                                  child: Text('ADD CLUB EVENT',
                                      style: GoogleFonts.poppins(
                                          fontSize: 17,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w900)),
                                ),
                              ),
                              SizedBox(
                                width: 40,
                              ),
                              MouseRegion(
                                cursor: SystemMouseCursors.click,
                                child: GestureDetector(
                                  onTap: () {
                                    Scrollable.ensureVisible(
                                        dataKey3.currentContext!);
                                  },
                                  child: Text('HOME',
                                      style: GoogleFonts.poppins(
                                          fontSize: 17,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w900)),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Row(
                            children: [
                              MouseRegion(
                                cursor: SystemMouseCursors.click,
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => ContactUs()));
                                  },
                                  child: Text('CONTACT US',
                                      style: GoogleFonts.poppins(
                                          fontSize: 17,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w900)),
                                ),
                              ),
                              SizedBox(
                                width: 40,
                              ),
                              MouseRegion(
                                cursor: SystemMouseCursors.click,
                                child: GestureDetector(
                                  onTap: () async {
                                    await FirebaseAuth.instance.signOut();
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => MyApp()));
                                  },
                                  child: Text('Log Out',
                                      style: GoogleFonts.poppins(
                                          fontSize: 17,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w900)),
                                ),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                )),
              )
            ],
          ),
        )),
      ),
    );
  }
}
// class DesktopPage extends StatelessWidget {
//   const DesktopPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: DefaultTabController(
//         length: 5,
//         child: Container(
//           height: MediaQuery.of(context).size.height,
//           width: MediaQuery.of(context).size.width,
//           child: SingleChildScrollView(
//             child: Column(
//               children: [
//                 Container(
//                   decoration: BoxDecoration(color: Colors.white
//                       // image: DecorationImage(
//                       //     image: AssetImage('assets/images/vitb.jpg'),
//                       //     // fit: BoxFit.fill,

//                       //     opacity: 0.7,
//                       //     fit: BoxFit.fitWidth)
//                       ),
//                   height: 280,
//                   child: Stack(
//                     children: [
//                       CircularParticle(
//                         key: UniqueKey(),
//                         awayRadius: 80,
//                         numberOfParticles: 100,
//                         speedOfParticles: 1,
//                         height: 280,
//                         width: MediaQuery.of(context).size.width,
//                         onTapAnimation: true,

//                         particleColor: Colors.white.withAlpha(150),
//                         awayAnimationDuration: Duration(milliseconds: 600),
//                         maxParticleSize: 13,
//                         isRandSize: true,
//                         isRandomColor: true,
//                         randColorList: [
//                           Colors.red.withAlpha(210),
//                           // Colors.blue.withAlpha(210),
//                           // Colors.yellow.withAlpha(210),
//                           Colors.lightBlueAccent.withAlpha(210)
//                         ],
//                         awayAnimationCurve: Curves.easeInOutBack,
//                         enableHover: true,
//                         hoverColor: Colors.white,
//                         hoverRadius: 90,
//                         connectDots: false, //not recommended
//                       ),
//                       Column(
//                         children: [
//                           Container(
//                             height: 100,
//                             width: MediaQuery.of(context).size.width,
//                             child: Padding(
//                               padding:
//                                   const EdgeInsets.only(left: 147, right: 147),
//                               child: Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Text('CLUBHOUSE',
//                                       style: GoogleFonts.poppins(
//                                           fontSize: 36,
//                                           color: Colors.black,
//                                           fontWeight: FontWeight.w900)),
//                                   Container(
//                                     width: 600,
//                                     child: Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceBetween,
//                                       children: [
//                                         Text(
//                                           'About',
//                                           style: GoogleFonts.lato(
//                                               fontWeight: FontWeight.w600,
//                                               fontSize: 22,
//                                               color: Colors.black),
//                                         ),
//                                         Text('Events',
//                                             style: GoogleFonts.lato(
//                                                 fontWeight: FontWeight.w600,
//                                                 fontSize: 22,
//                                                 color: Colors.black)),
//                                         Text('Hackathons',
//                                             style: GoogleFonts.lato(
//                                                 fontWeight: FontWeight.w600,
//                                                 fontSize: 22,
//                                                 color: Colors.black)),
//                                         Text('Contact Us',
//                                             style: GoogleFonts.lato(
//                                                 fontWeight: FontWeight.w600,
//                                                 fontSize: 22,
//                                                 color: Colors.black)),
//                                         Icon(
//                                           Icons.account_circle,
//                                           size: 40,
//                                           color: Colors.blue,
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                           SizedBox(
//                             height: 40,
//                           ),
//                           Text(
//                             'ABOUT',
//                             style: GoogleFonts.lato(
//                                 fontSize: 62,
//                                 // color: HexColor('#acebf6'),
//                                 color: Color.fromARGB(255, 1, 12, 21),
//                                 fontWeight: FontWeight.w900,
//                                 letterSpacing: 3.1),
//                           )
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//                 Container(
//                   height: 500,
//                   decoration: BoxDecoration(
//                     image: DecorationImage(
//                         image: AssetImage('assets/images/aboutbg.png'),
//                         fit: BoxFit.fill),
//                   ),
//                   child: Column(
//                     children: [
//                       Container(
//                         height: 300,
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Padding(
//                               padding: const EdgeInsets.only(
//                                   left: 220, right: 220, top: 60),
//                               child: Text(
//                                 'College events keep you positive, fresh, energetic and go a long way in making you more productive. Not only this but also provides learning in form of thoughtful sessions and hackathons. But how do you know about all the upcoming events in the university. In the busy schedule we lose track of going through all the mails from the clubs and we end up missing some amazing events. This is where VIT CLUBHOUSE is useful. In this Cross Platform Application all the information of upcoming and ongoing events will be present. Students will also be notified whenever there is a new event or a event is started.',
//                                 textAlign: TextAlign.justify,
//                                 style: GoogleFonts.poppins(
//                                     fontSize: 20,
//                                     wordSpacing: 5,
//                                     color: Colors.white,
//                                     // fontWeight: FontWeight.w900,
//                                     letterSpacing: 3.1),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Container(
//                         height: 200,
//                         child: Row(
//                           children: [],
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ],
//             ),
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
      child: PhysicalModel(
        color: Colors.black,
        elevation: 8.0,
        borderRadius: BorderRadius.circular(13),
        child: Container(
          height: 280,
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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 13, left: 17, right: 17),
                child: Container(
                  height: 150,
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
                padding: const EdgeInsets.only(left: 15, top: 8, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          widget.date,
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
      ),
    );
  }
}

class ClubPart extends StatelessWidget {
  const ClubPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 300,
        width: 300,
        color: Colors.black,
      ),
    );
  }
}
