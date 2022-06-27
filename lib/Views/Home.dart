import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:monkey_mind/Views/Medidate.dart';
import 'package:monkey_mind/Views/Profile.dart';

import 'Setting.dart';

class Home extends StatefulWidget
{
  HomeState createState()=>HomeState();
}
class HomeState extends State<Home>
{
  static List<Widget> _widgetOptions = <Widget>[
    Profile(),
    Medidate(),
    Setting(),
  ];
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),

      bottomNavigationBar: BottomNavigationBar(

        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
              backgroundColor: Colors.green
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.medical_services_outlined),
              label:'Medidate',
              backgroundColor: Colors.yellow
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label:'Setting',
            backgroundColor: Colors.blue,
          ),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        iconSize: 40,
        onTap: _onItemTapped,
        elevation: 5
    ),  );
  }

}