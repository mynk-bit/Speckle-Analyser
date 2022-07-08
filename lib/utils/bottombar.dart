import 'package:flutter/material.dart';
import 'package:speckle_analyser/Pages/check.dart';
import 'package:speckle_analyser/Pages/home.dart';
import 'package:speckle_analyser/Pages/visualize_screen.dart';

class myBottombar extends StatefulWidget {
  const myBottombar({Key? key}) : super(key: key);

  @override
  State<myBottombar> createState() => _myBottombarState();
}

class _myBottombarState extends State<myBottombar> {
  int _selectedIndex = 0;
  void _onItemTapped(int idx) {
    setState(() {
      _selectedIndex = idx;
    });
    if (idx == 0) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => MyHomePage(title: 'Home',)));
    } else if (idx == 1) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => CheckPage()));
    } else {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => methodPage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Settings',
        ),
      ],
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
    );
  }
}
