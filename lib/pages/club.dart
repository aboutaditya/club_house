import 'package:auto_size_text/auto_size_text.dart';
import 'package:club_house/navigation_bar/drawer.dart';
import 'package:club_house/navigation_bar/top_navigation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:url_launcher/url_launcher_string.dart';

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
              child: Column(
                children: [
                  SizedBox(),
                  NavBar(),
                  ClubData(
                    qty: 4,
                    height: 1.25,
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
                  ClubData(
                    height: 1.16,
                    qty: 3,
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
                    qty: 2,
                    height: 1.2,
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
                    height: 1.07,
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
  ClubData({super.key, required this.qty, required this.height});
  Color bg = Colors.white;
  int qty;
  double height;
  launchURL(String url) async {
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    // if(media)
    return Container(
      // color: Colors.white24
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/Clubbg.png'), fit: BoxFit.fill)),
      height: MediaQuery.of(context).size.height -
            MediaQuery.of(context).size.height / 11.5,
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.count(
              // Desktop-1.25 max all
              // Mobile-1.07-- max 430
              childAspectRatio: height,
              crossAxisCount: qty,
              children: List.generate(6, (index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(13),
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [HexColor('FDFCFB'), HexColor('E2D1C3')])),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 13, left: 17, right: 17),
                          child: Container(
                            height: MediaQuery.of(context).size.height / 5,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(17),
                                image: DecorationImage(
                                    image: AssetImage(
                                      'assets/images/Clubbg.png',
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
                                "Tech Naama",
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
                                      'BIT BY BIT',
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
                              left: 15, top: 8, right: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Text(
                                    "Saturday, 26 November, 2022",
                                    style: GoogleFonts.poppins(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  launchURL(
                                      'https://summerofcode.withgoogle.com/');
                                },
                                child: Icon(
                                  Icons.link_outlined,
                                  color: Colors.black,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              })),
        ),
      ),
    );
  }
}
