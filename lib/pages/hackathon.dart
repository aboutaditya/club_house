import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../navigation_bar/drawer.dart';
import '../navigation_bar/top_navigation.dart';

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
              child: Column(
                children: [
                  SizedBox(),
                  NavBar(),
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
          );
        } else if (constraints.maxWidth <= 1300 && constraints.maxWidth > 960) {
          return Scaffold(
            body: Container(
              child: Column(
                children: [
                  SizedBox(),
                  NavBar(),
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
          );
        } else if (constraints.maxWidth <= 960 && constraints.maxWidth > 730) {
          return Scaffold(
            body: Container(
              child: Column(
                children: [
                  SizedBox(),
                  NavBar(),
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
          );
        } else if (constraints.maxWidth <= 730 && constraints.maxWidth > 430) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: Colors.black,
              title: Text(
                "Hackathons",
                style: GoogleFonts.poppins(color: Colors.white),
              ),
            ),
            body: Container(
              height: MediaQuery.of(context).size.height,
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
            endDrawer: MyDrawer(),
            endDrawerEnableOpenDragGesture: false,
          );
        } else {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: Colors.black,
              title: Text(
                "Hackathons",
                style: GoogleFonts.poppins(color: Colors.white),
              ),
            ),
            body: Container(
              height: MediaQuery.of(context).size.height,
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
            endDrawer: MyDrawer(),
            endDrawerEnableOpenDragGesture: false,
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

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/Clubbg.png"),
                fit: BoxFit.fill)),
        height: MediaQuery.of(context).size.height -
            MediaQuery.of(context).size.height / 11.5,
        // height: double.infinity,
        child: Padding(
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height / 20,
              left: MediaQuery.of(context).size.width / 17,
              right: MediaQuery.of(context).size.width / 17),
          child: GridView.count(
            crossAxisCount: qty,
            childAspectRatio: 2.1,
            // padding: EdgeInsets.all(13),
            children: List.generate(6, (index) {
              return Padding(
                padding:
                    const EdgeInsets.only(left: 8, right: 8, top: 8, bottom: 5),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(17),
                      // color: Colors.white
                      gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [HexColor('FDFCFB'), HexColor('E2D1C3')])),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                left: paddingl, right: 8, top: 12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AutoSizeText(
                                  "Google Summer of Code",
                                  style: TextStyle(
                                      fontSize: font1.toDouble(),
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 4),
                                  child: Text(
                                    "Google",
                                    style: TextStyle(
                                        fontSize: font2.toDouble(),
                                        color: Colors.grey),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(17),
                            child: GestureDetector(
                              onTap: (() {
                                launchURL(
                                    'https://summerofcode.withgoogle.com/');
                              }),
                              child: CircleAvatar(
                                  backgroundColor:
                                      Color.fromARGB(255, 245, 247, 247),
                                  child: Icon(
                                    Icons.link,
                                    color: Colors.black,
                                  )),
                            ),
                          )
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
                                          "OPEN SOURCE",
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
                                            "ONLINE",
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
                                          "STARTS 29/03/2023",
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
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.blue[400],
                                    borderRadius: BorderRadius.circular(10)),
                                child: Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Text(
                                    'Know More',
                                    style: TextStyle(
                                        fontSize: font4.toDouble(),
                                        color: Colors.white),
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
              );
            }),
          ),
        ));
  }
}
