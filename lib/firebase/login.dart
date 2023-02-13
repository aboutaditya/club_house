import 'package:club_house/landingpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;


void _signOut() async {
  await FirebaseAuth.instance.signOut();
  print("User signed out");
}
