import 'package:club_house/main.dart';
import 'package:club_house/pages/club.dart';
import 'package:flutter/material.dart';

class BottomNavMobile extends StatefulWidget {
  const BottomNavMobile({super.key});

  @override
  State<BottomNavMobile> createState() => _BottomNavMobileState();
}

class _BottomNavMobileState extends State<BottomNavMobile> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    MyApp(),
    ClubEvent(),
    Text(
      'Hackathon',
      style: optionStyle,
    ),Text(
      'Dev Events',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BottomNavigationBar Sample'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Club',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Hackathon',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
