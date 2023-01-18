import 'dart:js';

import 'package:club_house/landingpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
void _createUserWithEmailAndPassword(
    String emailu, String passwordu, context) async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: emailu, password: passwordu);
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

void _signOut() async {
  await FirebaseAuth.instance.signOut();
  print("User signed out");
}
