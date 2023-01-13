import 'package:auto_size_text/auto_size_text.dart';
import 'package:club_house/navigation_bar/drawer.dart';
import 'package:club_house/navigation_bar/top_navigation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

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
        if (constraints.maxWidth > 900) {
          return Scaffold(
            body: Container(
              child: Column(
                children: [
                  SizedBox(),
                  NavBar(),
                  ClubData(
                    qty: 2,
                  )
                ],
              ),
            ),
          );
        } else if (constraints.maxWidth <= 900 && constraints.maxWidth > 700) {
          return Scaffold(
            body: Container(
              child: Column(
                children: [
                  SizedBox(),
                  NavBar(),
                  ClubData(
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
                "CLUB EVENTS",
                style: GoogleFonts.poppins(color: Colors.white),
              ),
            ),
            body: Container(
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  // SizedBox(),
                  // NavBar(),
                  ClubData(
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

class ClubData extends StatelessWidget {
  ClubData({super.key, required this.qty});
  Color bg = Colors.white;
  int qty;
  @override
  Widget build(BuildContext context) {
    // if(media)
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/Clubbg.png"),
                fit: BoxFit.fill)),
        height: MediaQuery.of(context).size.height / 1.1,
        // color: Color.fromARGB(255, 245, 247, 247),
        child: Padding(
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height / 20,
              left: MediaQuery.of(context).size.width / 17,
              right: MediaQuery.of(context).size.width / 17),
          child: GridView.count(
            crossAxisCount: qty,
            childAspectRatio: 2.1,
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
                              children: const [
                                AutoSizeText(
                                  "CodeJam",
                                  style: TextStyle(
                                      fontSize: 35,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 4),
                                  child: Text(
                                    "Google",
                                    style: TextStyle(
                                        fontSize: 23, color: Colors.grey),
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
