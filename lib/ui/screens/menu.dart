import 'package:flutter/material.dart';
import 'package:go_farm/ui/constant/constant.dart';
import 'package:go_farm/ui/presentation/custom_icons_icons.dart';
import 'package:go_farm/ui/screens/home/home.dart';
import 'package:go_farm/ui/screens/infections/infections.dart';
import 'package:go_farm/ui/screens/profile/profile.dart';
import 'package:go_farm/ui/screens/seeds/seeds.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {

  int _currentIndex = 0;

  final _tabs = [
    Home(),
    Seeds(),
    Infections(),
    Profile()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        // selectedItemColor: primaryColor,
        unselectedItemColor: Colors.grey,
        iconSize: 30,
        items: [
          BottomNavigationBarItem(icon: Icon(CustomIcons.home_1), title: Text('Home')),
          BottomNavigationBarItem(icon: Icon(CustomIcons.seedling), title: Text('Seeds')),
          BottomNavigationBarItem(icon: Icon(CustomIcons.bug), title: Text('Infections')),
          BottomNavigationBarItem(icon: Icon(CustomIcons.user_1), title: Text('Profile')),
        ],
        onTap: (int i){
          setState(() {
            _currentIndex = i;
          });
        },
      ),
      body: _tabs[_currentIndex],
    );
  }
}