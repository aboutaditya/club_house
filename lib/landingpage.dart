import 'package:club_house/desktoplanding.dart';
import 'package:club_house/mobilelanding.dart';
import 'package:flutter/material.dart';

import 'home.dart';

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
          return DesktopPage();
        } else {
          return Home();
        }
      },
    );
  }
}
