import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 800) {
          return Row(
            children: pageLanding(constraints.biggest.width / 2,
                MediaQuery.of(context).size.height),
          );
        } else {
          return Column(
            children: pageLanding(
                constraints.biggest.width, MediaQuery.of(context).size.height),
          );
        }
      },
    );
  }
}

List<Widget> pageLanding(double width, double height) {
  return <Widget>[
    Container(
      // color: Colors.amber,
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 26, left: 44, right: 25),
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
                      fontSize: 26, color: Color.fromRGBO(90, 117, 127, 1)),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 17, left: 44, right: 25),
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
                      onPressed: () {},
                      child: Text(
                        'Club Events',
                        style: TextStyle(color: Colors.white, fontSize: 17),
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
                        onPressed: () {},
                        child: Text(
                          'Hackathons',
                          style: TextStyle(color: Colors.white, fontSize: 17),
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
          width: width,
        ),
      ],
    )
  ];
}
