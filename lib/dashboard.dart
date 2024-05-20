import 'package:flutter/material.dart';
import 'package:lovelove/dashboard/akun/account.dart';
import 'package:lovelove/dashboard/catatan/catatan.dart';
import 'package:lovelove/dashboard/homescreen/homescreen.dart';
import 'package:lovelove/dashboard/musik/musik.dart';

class dashboard extends StatefulWidget {
  const dashboard({super.key});

  @override
  State<dashboard> createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {
  int _selectedIndex = 0;
  final _screens = [
    homescreen(),
    catatan(),
    musik(),
    account(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _screens[_selectedIndex],
      bottomNavigationBar: Container(
        height: 80,
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.pink,
          unselectedItemColor: Colors.black26,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Love"),
            BottomNavigationBarItem(
                icon: Icon(Icons.music_note_outlined), label: "Music"),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle), label: "Account"),
          ],
        ),
      ),
    );
  }
}
