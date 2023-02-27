import 'package:club_house/Signup.dart';
import 'package:club_house/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'landingpage.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 1100) {
          return const DesktopSignin();
        } else {
          return const MobileSingin();
        }
      },
    );
  }
}

class DesktopSignin extends StatelessWidget {
  const DesktopSignin({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/signin.png'),
              opacity: 0.53,
              fit: BoxFit.fill),
        ),
        child: Center(
          child: Container(
              height: MediaQuery.of(context).size.height * 0.9,
              width: MediaQuery.of(context).size.width * 0.91,
              child: Row(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.9,
                    width: MediaQuery.of(context).size.width * 0.3,
                    decoration: BoxDecoration(color: Colors.white),
                    child: Center(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.07,
                            width: MediaQuery.of(context).size.width * 0.22,
                          child: Row(
                            children: [
                              Text(
                                "Welcome back",
                                style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontSize: 27,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 17,
                        ),
                        Container(
                            height: MediaQuery.of(context).size.height * 0.07,
                            width: MediaQuery.of(context).size.width * 0.22,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: Colors.black, width: 1.4)),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 8,
                              ),
                              child: TextField(
                                controller: email,
                                style: TextStyle(color: Colors.black),
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Enter your email",
                                    hintStyle: GoogleFonts.poppins(
                                        color: Colors.black, fontSize: 14)),
                              ),
                            )),
                        SizedBox(
                          height: 13,
                        ),
                        Container(
                            height: MediaQuery.of(context).size.height * 0.07,
                            width: MediaQuery.of(context).size.width * 0.22,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: Colors.black, width: 1.4)),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 8,
                              ),
                              child: TextField(
                                controller: password,
                                style: TextStyle(color: Colors.black),
                                obscureText: true,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Password",
                                    hintStyle: GoogleFonts.poppins(
                                        color: Colors.black, fontSize: 14)),
                              ),
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () {
                              _signInWithEmailAndPassword(
                                  email.text, password.text, context);
                            },
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.07,
                              width: MediaQuery.of(context).size.width * 0.22,
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: Colors.black, width: 1.4)),
                              child: Center(
                                  child: Text(
                                "Sign In",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 17),
                              )),
                            ),
                          ),
                        ),
                        // SizedBox(
                        //   height: 10,
                        // ),
                        // MouseRegion(
                        //   cursor: SystemMouseCursors.click,
                        //   child: GestureDetector(
                        //     child: Container(
                        //       height: MediaQuery.of(context).size.height * 0.07,
                        //       width: MediaQuery.of(context).size.width * 0.22,
                        //       decoration: BoxDecoration(
                        //           color: Colors.white,
                        //           borderRadius: BorderRadius.circular(10),
                        //           border: Border.all(
                        //               color: Colors.black, width: 1.4)),
                        //       child: Center(
                        //           child: Row(
                        //         mainAxisAlignment: MainAxisAlignment.center,
                        //         children: [
                        //           Image.asset(
                        //             'assets/images/google.png',
                        //             height: 35,
                        //             width: 35,
                        //           ),
                        //           SizedBox(
                        //             width: 10,
                        //           ),
                        //           Text(
                        //             "Sign In with Google",
                        //             style: TextStyle(
                        //                 color: Colors.black,
                        //                 fontSize: 17,
                        //                 fontWeight: FontWeight.w600),
                        //           ),
                        //         ],
                        //       )),
                        //     ),
                        //   ),
                        // ),
                        SizedBox(
                          height: 13,
                        ),
                        MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(_createRoute());
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Dont have an account?',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal)),
                                SizedBox(
                                  width: 4,
                                ),
                                Text("Sign Up",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold))
                              ],
                            ),
                          ),
                        )
                      ],
                    )),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.9,
                    width: MediaQuery.of(context).size.width * 0.61,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/code.webp'),
                          fit: BoxFit.fill),
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }
}

class MobileSingin extends StatefulWidget {
  const MobileSingin({super.key});

  @override
  State<MobileSingin> createState() => _MobileSinginState();
}

class _MobileSinginState extends State<MobileSingin> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/signin.png'),
              opacity: 0.53,
              fit: BoxFit.fill),
        ),
        child: Center(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.62,
            width: MediaQuery.of(context).size.width * 0.91,
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 35),
                  child: Row(
                    children: [
                      Text(
                        "Welcome back",
                        style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 27,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 22,
                ),
                Container(
                    height: MediaQuery.of(context).size.height * 0.07,
                    width: MediaQuery.of(context).size.width * 0.80,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black, width: 1.4)),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 8,
                      ),
                      child: TextField(
                        controller: email,
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Enter your email",
                            hintStyle: GoogleFonts.poppins(
                                color: Colors.black, fontSize: 14)),
                      ),
                    )),
                SizedBox(
                  height: 17,
                ),
                Container(
                    height: MediaQuery.of(context).size.height * 0.07,
                    width: MediaQuery.of(context).size.width * 0.80,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black, width: 1.4)),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 8,
                      ),
                      child: TextField(
                        controller: password,
                        style: TextStyle(color: Colors.black),
                        obscureText: true,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Password",
                            hintStyle: GoogleFonts.poppins(
                                color: Colors.black, fontSize: 14)),
                      ),
                    )),
                SizedBox(
                  height: 17,
                ),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () {
                      _signInWithEmailAndPasswordMobile(
                          email.text, password.text, context);
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.07,
                      width: MediaQuery.of(context).size.width * 0.80,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black, width: 1.4)),
                      child: Center(
                          child: Text(
                        "Sign In",
                        style: TextStyle(color: Colors.white, fontSize: 17),
                      )),
                    ),
                  ),
                ),
                // SizedBox(
                //   height: 17,
                // ),
                // MouseRegion(
                //   cursor: SystemMouseCursors.click,
                //   child: GestureDetector(
                //     child: Container(
                //       height: MediaQuery.of(context).size.height * 0.07,
                //       width: MediaQuery.of(context).size.width * 0.80,
                //       decoration: BoxDecoration(
                //           color: Colors.white,
                //           borderRadius: BorderRadius.circular(10),
                //           border: Border.all(color: Colors.black, width: 1.4)),
                //       child: Center(
                //           child: Row(
                //         mainAxisAlignment: MainAxisAlignment.center,
                //         children: [
                //           Image.asset(
                //             'assets/images/google.png',
                //             height: 35,
                //             width: 35,
                //           ),
                //           SizedBox(
                //             width: 10,
                //           ),
                //           Text(
                //             "Sign In with Google",
                //             style: TextStyle(
                //                 color: Colors.black,
                //                 fontSize: 17,
                //                 fontWeight: FontWeight.w600),
                //           ),
                //         ],
                //       )),
                //     ),
                //   ),
                // ),
                SizedBox(
                  height: 17,
                ),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(_createRoute());
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Dont have an account?',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.normal)),
                        SizedBox(
                          width: 4,
                        ),
                        Text("Sign Up",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold))
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => SignupPage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

void _signInWithEmailAndPassword(
    String emailu, String passwordu, context) async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: emailu, password: passwordu);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const LandingPage()));
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Color.fromARGB(0, 255, 255, 255),
        content: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/signin.png'),
                    fit: BoxFit.fill),
                color: Colors.black,
                borderRadius: BorderRadius.circular(12)),
            height: MediaQuery.of(context).size.height * 0.1,
            width: MediaQuery.of(context).size.width * 0.6,
            child: Center(
                child: Text(
              'No user found for that email.',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.bold),
            ))),
      ));
      print('No user found for that email.');
    } else if (e.code == 'wrong-password') {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Color.fromARGB(0, 255, 255, 255),
        content: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/signin.png'),
                    fit: BoxFit.fill),
                color: Colors.black,
                borderRadius: BorderRadius.circular(12)),
            height: MediaQuery.of(context).size.height * 0.1,
            width: MediaQuery.of(context).size.width * 0.6,
            child: Center(
                child: Text(
              'Incorrect password provided for that user.',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.bold),
            ))),
      ));
      print('Wrong password provided for that user.');
    }
  }
}

void _signInWithEmailAndPasswordMobile(
    String emailu, String passwordu, context) async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: emailu, password: passwordu);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const Home()));
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Color.fromARGB(0, 255, 255, 255),
        content: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/signin.png'),
                    fit: BoxFit.fill),
                color: Colors.black,
                borderRadius: BorderRadius.circular(12)),
            height: MediaQuery.of(context).size.height * 0.1,
            width: MediaQuery.of(context).size.width * 0.6,
            child: Center(
                child: Text(
              'No user found for that email.',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.bold),
            ))),
      ));
      print('No user found for that email.');
    } else if (e.code == 'wrong-password') {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Color.fromARGB(0, 255, 255, 255),
        content: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/signin.png'),
                    fit: BoxFit.fill),
                color: Colors.black,
                borderRadius: BorderRadius.circular(12)),
            height: MediaQuery.of(context).size.height * 0.1,
            width: MediaQuery.of(context).size.width * 0.6,
            child: Center(
                child: Text(
              'Incorrect password provided for that user.',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.bold),
            ))),
      ));
      print('Wrong password provided for that user.');
    }
  }
}
