import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:club_house/landingpage.dart';
import 'package:flutter/material.dart';

class ClubAdd extends StatefulWidget {
  const ClubAdd({super.key});

  @override
  State<ClubAdd> createState() => _ClubAddState();
}

class _ClubAddState extends State<ClubAdd> {
  TextEditingController ename = TextEditingController();
  TextEditingController cname = TextEditingController();
  TextEditingController date = TextEditingController();
  TextEditingController link = TextEditingController();
  TextEditingController banner = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/add.webp'),
                opacity: 0.3,
                fit: BoxFit.fill)),
        child: Center(
          child: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * (0.9),
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/add.webp',
                    fit: BoxFit.fill,
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: MediaQuery.of(context).size.height * 0.9,
                  ),
                  Container(
                    color: Colors.white,
                    width: MediaQuery.of(context).size.width * 0.3,
                    height: MediaQuery.of(context).size.height * 0.9,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Add Your Event',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 31,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 35,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  decoration: const BoxDecoration(
                                      border: Border(
                                          bottom:
                                              BorderSide(color: Colors.black))),
                                  width: MediaQuery.of(context).size.width *
                                      (0.25),
                                  child: TextField(
                                    controller: ename,
                                    decoration: InputDecoration(
                                        labelText: 'Event Name',
                                        labelStyle: TextStyle(
                                            color: Colors.black, fontSize: 26)),
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 26),
                                  )),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                  decoration: const BoxDecoration(
                                      border: Border(
                                          bottom:
                                              BorderSide(color: Colors.black))),
                                  width: MediaQuery.of(context).size.width *
                                      (0.25),
                                  child: TextField(
                                    controller: cname,
                                    decoration: InputDecoration(
                                        labelText: 'Club Name',
                                        labelStyle: TextStyle(
                                            color: Colors.black, fontSize: 26)),
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 26),
                                  )),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                  decoration: const BoxDecoration(
                                      border: Border(
                                          bottom:
                                              BorderSide(color: Colors.black))),
                                  width: MediaQuery.of(context).size.width *
                                      (0.25),
                                  child: TextField(
                                    controller: date,
                                    decoration: InputDecoration(
                                        labelText: 'Date',
                                        labelStyle: TextStyle(
                                            color: Colors.black, fontSize: 26)),
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 26),
                                  )),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                  decoration: const BoxDecoration(
                                      border: Border(
                                          bottom:
                                              BorderSide(color: Colors.black))),
                                  width: MediaQuery.of(context).size.width *
                                      (0.25),
                                  child: TextField(
                                    controller: link,
                                    decoration: InputDecoration(
                                        labelText: 'Registration Link',
                                        labelStyle: TextStyle(
                                            color: Colors.black, fontSize: 26)),
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 26),
                                  )),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                  decoration: const BoxDecoration(
                                      border: Border(
                                          bottom:
                                              BorderSide(color: Colors.black))),
                                  width: MediaQuery.of(context).size.width *
                                      (0.25),
                                  child: TextField(
                                    controller: banner,
                                    decoration: InputDecoration(
                                        labelText: 'Banner Image Link',
                                        labelStyle: TextStyle(
                                            color: Colors.black, fontSize: 26)),
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 26),
                                  )),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 26,
                        ),
                        GestureDetector(
                          onTap: () {
                            AddClub(ename.text, cname.text, date.text,
                                link.text, banner.text);
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Congrats your event is added'),
                              ),
                            );
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LandingPage()));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.redAccent),
                            child: Padding(
                              padding: const EdgeInsets.all(13.0),
                              child: Text(
                                'Submit Your Event',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 17),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }
}

Future AddClub(String eName, String cname, String date, String link,
    String bannerLink) async {
  final docUser =
      FirebaseFirestore.instance.collection('Club Events').doc(eName);
  final json = {
    'name': eName,
    'cname': cname,
    'Date': date,
    'link': link,
    'banner': bannerLink

    // 'Date':DateTime.(2023,11,01)
  };
  await docUser.set(json);
}
