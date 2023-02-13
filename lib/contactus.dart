import 'package:club_house/contactmobile.dart';
import 'package:club_house/pages/club.dart';
import 'package:club_house/pages/hackathon.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:particles_flutter/particles_flutter.dart';

import 'landingpage.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 800) {
          return DesktopContact();
        } else {
          return MobileContact();
        }
      },
    );
  }
}

class DesktopContact extends StatelessWidget {
  const DesktopContact({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
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
                              padding:
                                  const EdgeInsets.only(left: 147, right: 147),
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
                                                      fontWeight:
                                                          FontWeight.w600,
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
                                                      fontWeight:
                                                          FontWeight.w600,
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
                                                child: Text('Contact Us',
                                                    style: GoogleFonts.lato(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 22,
                                                        color: Colors.black)),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ])),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text('CONTACT US',
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
              Container(
                height: MediaQuery.of(context).size.height * 1.7,
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Stack(
                          children: [
                            Container(
                              height: 300,
                              width: 300,
                              decoration: BoxDecoration(
                                  // color: Colors.black,
                                  gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Colors.transparent,
                                        Colors.black87
                                      ]),
                                  borderRadius: BorderRadius.circular(8),
                                  image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: AssetImage(
                                          'assets/images/aditya.jpg'))),
                            ),
                            Container(
                              height: 300,
                              width: 300,
                              decoration: BoxDecoration(
                                // color: Colors.black,
                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Colors.transparent,
                                      Colors.transparent,
                                      Colors.black87
                                    ]),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Aditya',
                                          style: GoogleFonts.poppins(
                                              fontSize: 29,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Row(
                                          children: [
                                            Icon(FontAwesomeIcons.linkedin),
                                            SizedBox(
                                              width: 8,
                                            ),
                                            Icon(FontAwesomeIcons.instagram)
                                          ],
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Stack(
                          children: [
                            Container(
                              height: 300,
                              width: 300,
                              decoration: BoxDecoration(
                                  // color: Colors.black,
                                  gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Colors.transparent,
                                        Colors.black87
                                      ]),
                                  borderRadius: BorderRadius.circular(8),
                                  image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: AssetImage(
                                          'assets/images/laksh.jpeg'))),
                            ),
                            Container(
                              height: 300,
                              width: 300,
                              decoration: BoxDecoration(
                                // color: Colors.black,
                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Colors.transparent,
                                      Colors.transparent,
                                      Colors.black87
                                    ]),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Lakshay',
                                          style: GoogleFonts.poppins(
                                              fontSize: 29,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Row(
                                          children: [
                                            Icon(FontAwesomeIcons.linkedin),
                                            SizedBox(
                                              width: 8,
                                            ),
                                            Icon(FontAwesomeIcons.instagram)
                                          ],
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Stack(
                          children: [
                            Container(
                              height: 300,
                              width: 300,
                              decoration: BoxDecoration(
                                  // color: Colors.black,
                                  gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Colors.transparent,
                                        Colors.black87
                                      ]),
                                  borderRadius: BorderRadius.circular(8),
                                  image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: AssetImage(
                                          'assets/images/kunal.jpeg'))),
                            ),
                            Container(
                              height: 300,
                              width: 300,
                              decoration: BoxDecoration(
                                // color: Colors.black,
                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Colors.transparent,
                                      Colors.transparent,
                                      Colors.black87
                                    ]),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Kunal',
                                          style: GoogleFonts.poppins(
                                              fontSize: 29,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Row(
                                          children: [
                                            Icon(FontAwesomeIcons.linkedin),
                                            SizedBox(
                                              width: 8,
                                            ),
                                            Icon(FontAwesomeIcons.instagram)
                                          ],
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Stack(
                          children: [
                            Container(
                              height: 300,
                              width: 300,
                              decoration: BoxDecoration(
                                  // color: Colors.black,
                                  gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Colors.transparent,
                                        Colors.black87
                                      ]),
                                  borderRadius: BorderRadius.circular(8),
                                  image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: AssetImage(
                                          'assets/images/palak.jpeg'))),
                            ),
                            Container(
                              height: 300,
                              width: 300,
                              decoration: BoxDecoration(
                                // color: Colors.black,
                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Colors.transparent,
                                      Colors.transparent,
                                      Colors.black87
                                    ]),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Palak',
                                          style: GoogleFonts.poppins(
                                              fontSize: 29,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Row(
                                          children: [
                                            Icon(FontAwesomeIcons.linkedin),
                                            SizedBox(
                                              width: 8,
                                            ),
                                            Icon(FontAwesomeIcons.instagram)
                                          ],
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Stack(
                          children: [
                            Container(
                              height: 300,
                              width: 300,
                              decoration: BoxDecoration(
                                  // color: Colors.black,
                                  gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Colors.transparent,
                                        Colors.black87
                                      ]),
                                  borderRadius: BorderRadius.circular(8),
                                  image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: AssetImage(
                                          'assets/images/manish.jpeg'))),
                            ),
                            Container(
                              height: 300,
                              width: 300,
                              decoration: BoxDecoration(
                                // color: Colors.black,
                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Colors.transparent,
                                      Colors.transparent,
                                      Colors.black87
                                    ]),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Manish',
                                          style: GoogleFonts.poppins(
                                              fontSize: 29,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Row(
                                          children: [
                                            Icon(FontAwesomeIcons.linkedin),
                                            SizedBox(
                                              width: 8,
                                            ),
                                            Icon(FontAwesomeIcons.instagram)
                                          ],
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: 350,
                          width: 300,
                          color: Colors.white,
                        ),
                      ],
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
