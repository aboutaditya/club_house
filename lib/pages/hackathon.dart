import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../navigation_bar/drawer.dart';
import '../navigation_bar/top_navigation.dart';

class Hackathon extends StatelessWidget {
  const Hackathon({super.key});

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
        if (constraints.maxWidth > 900) {
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
                  )
                ],
              ),
            ),
          );
        } else if (constraints.maxWidth <= 1300 && constraints.maxWidth > 900) {
          return Scaffold(
            body: Container(
              child: Column(
                children: [
                  SizedBox(),
                  NavBar(),
                  HackathonData(
                    font1: 24,
                    font2: 19,
                    qty: 2,
                  )
                ],
              ),
            ),
          );
        } else if (constraints.maxWidth <= 900 && constraints.maxWidth > 730) {
          return Scaffold(
            body: Container(
              child: Column(
                children: [
                  SizedBox(),
                  NavBar(),
                  HackathonData(
                    font1: 35,
                    font2: 22,
                    qty: 1,
                  )
                ],
              ),
            ),
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
                    font1: 25,
                    font2: 20,
                    qty: 1,
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
      {super.key, required this.qty, required this.font1, required this.font2});
  Color bg = Colors.white;
  int font1;
  int font2;
  int qty;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/Clubbg.png"),
                fit: BoxFit.fill)),
        height: MediaQuery.of(context).size.height / 1.15,
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
                padding: const EdgeInsets.all(13),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(17),
                      color: Colors.white),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(13),
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
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
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
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            "ONLINE",
                                            style: TextStyle(
                                                color: Colors.black87),
                                          ),
                                        )),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Color.fromARGB(
                                              255, 245, 247, 247),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          "STARTS 29/03/2023",
                                          style:
                                              TextStyle(color: Colors.black87),
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
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Know More',
                                    style: TextStyle(
                                        fontSize: 17, color: Colors.white),
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
