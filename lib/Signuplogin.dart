import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'landingpage.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 800) {
          return DesktopSignin();
        } else {
          return MobileSingin();
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
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            // width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/Clubbg.png'),fit: BoxFit.fill)
                // gradient: LinearGradient(
                //     colors: [Colors.black38, Colors.transparent]
                //     )
                ),
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white60,
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(17)),
                height: MediaQuery.of(context).size.height * 0.7,
                width: MediaQuery.of(context).size.width * 0.3,
                child: Column(
                  children: [
                    Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black45),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(17),
                              topRight: Radius.circular(17)),
                          color: Colors.green[200],
                        ),
                        height: MediaQuery.of(context).size.height * 0.08,
                        child: TabBar(indicatorColor: Colors.black, tabs: [
                          Text(
                            "LOGIN",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 22),
                          ),
                          Text(
                            "SIGN UP",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 22),
                          )
                        ])),
                    Expanded(
                      child: TabBarView(children: [
                        Container(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 31,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.27,
                              height: MediaQuery.of(context).size.height * 0.1,
                              decoration: BoxDecoration(
                                  color: Colors.green[200],
                                  borderRadius: BorderRadius.circular(8)),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Center(
                                  child: TextField(
                                    controller: email,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 26),
                                    decoration: InputDecoration(
                                        floatingLabelAlignment:
                                            FloatingLabelAlignment.center,
                                        hoverColor: Colors.blue,
                                        hintText: 'Enter Your Email',
                                        border: InputBorder.none,
                                        prefixIcon: Icon(
                                          Icons.email,
                                          color: Colors.black,
                                          size: 31,
                                        ),
                                        hintStyle:
                                            TextStyle(color: Colors.black),
                                        label: Text(
                                          'Email',
                                          style: TextStyle(
                                              color: Colors.black87,
                                              fontSize: 26),
                                        )),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            // password container
                            Container(
                              width: MediaQuery.of(context).size.width * 0.27,
                              height: MediaQuery.of(context).size.height * 0.1,
                              decoration: BoxDecoration(
                                  color: Colors.green[200],
                                  borderRadius: BorderRadius.circular(8)),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Center(
                                  child: TextField(
                                    controller: password,
                                    obscureText: true,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 26),
                                    decoration: InputDecoration(
                                        floatingLabelAlignment:
                                            FloatingLabelAlignment.center,
                                        hoverColor: Colors.blue,
                                        hintText: 'Enter Your Password',
                                        border: InputBorder.none,
                                        prefixIcon: Icon(
                                          Icons.password_outlined,
                                          color: Colors.black,
                                          size: 31,
                                        ),
                                        hintStyle:
                                            TextStyle(color: Colors.black),
                                        label: Text(
                                          'Password',
                                          style: TextStyle(
                                              color: Colors.black87,
                                              fontSize: 26),
                                        )),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.17,
                              height: MediaQuery.of(context).size.height * 0.06,
                              decoration: BoxDecoration(
                                  color: Colors.green[200],
                                  borderRadius: BorderRadius.circular(17)),
                              child: TextButton(
                                child: Text(
                                  "Login In",
                                  style: TextStyle(
                                      color: Colors.black87,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                                onPressed: (() {
                                  _signInWithEmailAndPassword(
                                      email.text, password.text, context);
                                }),
                              ),
                            )
                          ],
                        )),
                        Container(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 31,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.27,
                              height: MediaQuery.of(context).size.height * 0.1,
                              decoration: BoxDecoration(
                                  color: Colors.green[200],
                                  borderRadius: BorderRadius.circular(8)),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Center(
                                  child: TextField(
                                    controller: email,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 26),
                                    decoration: InputDecoration(
                                        floatingLabelAlignment:
                                            FloatingLabelAlignment.center,
                                        hoverColor: Colors.blue,
                                        hintText: 'Enter Your Email',
                                        border: InputBorder.none,
                                        prefixIcon: Icon(
                                          Icons.email,
                                          color: Colors.black,
                                          size: 31,
                                        ),
                                        hintStyle:
                                            TextStyle(color: Colors.black),
                                        label: Text(
                                          'Email',
                                          style: TextStyle(
                                              color: Colors.black87,
                                              fontSize: 26),
                                        )),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            // password container
                            Container(
                              width: MediaQuery.of(context).size.width * 0.27,
                              height: MediaQuery.of(context).size.height * 0.1,
                              decoration: BoxDecoration(
                                  color: Colors.green[200],
                                  borderRadius: BorderRadius.circular(8)),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Center(
                                  child: TextField(
                                    controller: password,
                                    obscureText: true,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 26),
                                    decoration: InputDecoration(
                                        floatingLabelAlignment:
                                            FloatingLabelAlignment.center,
                                        hoverColor: Colors.blue,
                                        hintText: 'Enter Your Password',
                                        border: InputBorder.none,
                                        prefixIcon: Icon(
                                          Icons.password_outlined,
                                          color: Colors.black,
                                          size: 31,
                                        ),
                                        hintStyle:
                                            TextStyle(color: Colors.black),
                                        label: Text(
                                          'Password',
                                          style: TextStyle(
                                              color: Colors.black87,
                                              fontSize: 26),
                                        )),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.17,
                              height: MediaQuery.of(context).size.height * 0.06,
                              decoration: BoxDecoration(
                                  color: Colors.green[200],
                                  borderRadius: BorderRadius.circular(17)),
                              child: TextButton(
                                child: Text(
                                  "Sign Up",
                                  style: TextStyle(
                                      color: Colors.black87,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                                onPressed: (() {
                                  _createUserWithEmailAndPassword(
                                      email.text, password.text, context);
                                }),
                              ),
                            )
                          ],
                        )),
                      ]),
                    )
                  ],
                ),
              ),
            ),
          )),
    );
  }
}

class MobileSingin extends StatelessWidget {
  const MobileSingin({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            // width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/Clubbg.png'),fit: BoxFit.fill)
                // gradient: LinearGradient(
                //     colors: [Colors.black38, Colors.transparent]
                //     )
                ),
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white60,
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(17)),
                height: MediaQuery.of(context).size.height * 0.53,
                width: MediaQuery.of(context).size.width * 0.95,
                child: Column(
                  children: [
                    Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black45),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(17),
                              topRight: Radius.circular(17)),
                          color: Colors.green[200],
                        ),
                        height: MediaQuery.of(context).size.height * 0.08,
                        child: TabBar(indicatorColor: Colors.black, tabs: [
                          Text(
                            "LOGIN",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 22),
                          ),
                          Text(
                            "SIGN UP",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 22),
                          )
                        ])),
                    Expanded(
                      child: TabBarView(children: [
                        Container(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 31,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.8,
                              height: MediaQuery.of(context).size.height * 0.1,
                              decoration: BoxDecoration(
                                  color: Colors.green[200],
                                  borderRadius: BorderRadius.circular(8)),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Center(
                                  child: TextField(
                                    controller: email,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 22),
                                    decoration: InputDecoration(
                                        floatingLabelAlignment:
                                            FloatingLabelAlignment.center,
                                        hoverColor: Colors.blue,
                                        hintText: 'Enter Your Email',
                                        border: InputBorder.none,
                                        prefixIcon: Icon(
                                          Icons.email,
                                          color: Colors.black,
                                          size: 22,
                                        ),
                                        hintStyle:
                                            TextStyle(color: Colors.black),
                                        label: Text(
                                          'Email',
                                          style: TextStyle(
                                              color: Colors.black87,
                                              fontSize: 24),
                                        )),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            // password container
                            Container(
                              width: MediaQuery.of(context).size.width * 0.8,
                              height: MediaQuery.of(context).size.height * 0.1,
                              decoration: BoxDecoration(
                                  color: Colors.green[200],
                                  borderRadius: BorderRadius.circular(8)),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Center(
                                  child: TextField(
                                    controller: password,
                                    obscureText: true,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 22),
                                    decoration: InputDecoration(
                                        floatingLabelAlignment:
                                            FloatingLabelAlignment.center,
                                        hoverColor: Colors.blue,
                                        hintText: 'Enter Your Password',
                                        border: InputBorder.none,
                                        prefixIcon: Icon(
                                          Icons.password_outlined,
                                          color: Colors.black,
                                          size: 22,
                                        ),
                                        hintStyle:
                                            TextStyle(color: Colors.black),
                                        label: Text(
                                          'Password',
                                          style: TextStyle(
                                              color: Colors.black87,
                                              fontSize: 24),
                                        )),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.4,
                              height: MediaQuery.of(context).size.height * 0.06,
                              decoration: BoxDecoration(
                                  color: Colors.green[200],
                                  borderRadius: BorderRadius.circular(17)),
                              child: TextButton(
                                child: Text(
                                  "Login In",
                                  style: TextStyle(
                                      color: Colors.black87,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                                onPressed: (() {
                                  _signInWithEmailAndPassword(
                                      email.text, password.text, context);
                                }),
                              ),
                            )
                          ],
                        )),
                        Container(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 31,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.8,
                              height: MediaQuery.of(context).size.height * 0.1,
                              decoration: BoxDecoration(
                                  color: Colors.green[200],
                                  borderRadius: BorderRadius.circular(8)),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Center(
                                  child: TextField(
                                    controller: email,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 22),
                                    decoration: InputDecoration(
                                        floatingLabelAlignment:
                                            FloatingLabelAlignment.center,
                                        hoverColor: Colors.blue,
                                        hintText: 'Enter Your Email',
                                        border: InputBorder.none,
                                        prefixIcon: Icon(
                                          Icons.email,
                                          color: Colors.black,
                                          size: 22,
                                        ),
                                        hintStyle:
                                            TextStyle(color: Colors.black),
                                        label: Text(
                                          'Email',
                                          style: TextStyle(
                                              color: Colors.black87,
                                              fontSize: 24),
                                        )),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            // password container
                            Container(
                              width: MediaQuery.of(context).size.width * 0.8,
                              height: MediaQuery.of(context).size.height * 0.1,
                              decoration: BoxDecoration(
                                  color: Colors.green[200],
                                  borderRadius: BorderRadius.circular(8)),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Center(
                                  child: TextField(
                                    controller: password,
                                    obscureText: true,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 22),
                                    decoration: InputDecoration(
                                        floatingLabelAlignment:
                                            FloatingLabelAlignment.center,
                                        hoverColor: Colors.blue,
                                        hintText: 'Enter Your Password',
                                        border: InputBorder.none,
                                        prefixIcon: Icon(
                                          Icons.password_outlined,
                                          color: Colors.black,
                                          size: 22,
                                        ),
                                        hintStyle:
                                            TextStyle(color: Colors.black),
                                        label: Text(
                                          'Password',
                                          style: TextStyle(
                                              color: Colors.black87,
                                              fontSize: 24),
                                        )),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.4,
                              height: MediaQuery.of(context).size.height * 0.06,
                              decoration: BoxDecoration(
                                  color: Colors.green[200],
                                  borderRadius: BorderRadius.circular(17)),
                              child: TextButton(
                                child: Text(
                                  "Sign Up",
                                  style: TextStyle(
                                      color: Colors.black87,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                                onPressed: (() {
                                  _createUserWithEmailAndPassword(
                                      email.text, password.text, context);
                                }),
                              ),
                            )
                          ],
                        )),
                      ]),
                    )
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
void _signInWithEmailAndPassword(
    String emailu, String passwordu, context) async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: emailu, password: passwordu);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => LandingPage()));
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text('No user found for that email.'),
      ));
      print('No user found for that email.');
    } else if (e.code == 'wrong-password') {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text('Wrong password provided for that user.'),
      ));
      print('Wrong password provided for that user.');
    }
  }
}

void _createUserWithEmailAndPassword(
    String emailu, String passwordu, context) async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: emailu, password: passwordu);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => LandingPage()));
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('The password provided is too weak.'),
        ),
      );
    } else if (e.code == 'email-already-in-use') {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('The account already exists for that email.'),
        ),
      );
      print('The account already exists for that email.');
    }
  } catch (e) {
    print(e);
  }
}
