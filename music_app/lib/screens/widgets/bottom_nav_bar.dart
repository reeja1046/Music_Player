import 'package:flutter/material.dart';
import 'package:music_app/screens/home_screens/home_screen.dart';
import 'package:music_app/screens/playlist/playlist.dart';
import 'package:music_app/screens/widgets/search_screen.dart';
import 'package:music_app/screens/settings_screens/settings.dart';

import 'package:super_bottom_navigation_bar/super_bottom_navigation_bar.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  final _pages = const [
    HomeScreen(),
    SearchScreen(),
    Playlist(),
    MainSettings(),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Navigator(
        onGenerateRoute: (RouteSettings settings) {
          return MaterialPageRoute(
            builder: (BuildContext context) => _pages[_selectedIndex],
          );
        },
      ),
      bottomNavigationBar: SuperBottomNavigationBar(
        // currentIndex: 0,
        items: const [
          SuperBottomNavigationBarItem(
              unSelectedIcon: Icons.home_outlined,
              selectedIcon: Icons.home,
              splashColor: Colors.teal,
              borderBottomColor: Colors.teal,
              backgroundShadowColor: Colors.teal,
              selectedIconColor: Colors.teal,
              unSelectedIconColor: Colors.grey),
          SuperBottomNavigationBarItem(
              unSelectedIcon: Icons.search,
              selectedIcon: Icons.search,
              splashColor: Colors.teal,
              borderBottomColor: Colors.teal,
              backgroundShadowColor: Colors.teal,
              selectedIconColor: Colors.teal,
              unSelectedIconColor: Colors.grey),
          SuperBottomNavigationBarItem(
              unSelectedIcon: Icons.playlist_add,
              selectedIcon: Icons.playlist_add_check,
              splashColor: Colors.teal,
              borderBottomColor: Colors.teal,
              backgroundShadowColor: Colors.teal,
              selectedIconColor: Colors.teal,
              unSelectedIconColor: Colors.grey),
          SuperBottomNavigationBarItem(
              unSelectedIcon: Icons.settings_outlined,
              selectedIcon: Icons.settings,
              splashColor: Colors.teal,
              borderBottomColor: Colors.teal,
              backgroundShadowColor: Colors.teal,
              selectedIconColor: Colors.teal,
              unSelectedIconColor: Colors.grey),
        ],
        onSelected: (index) {
          if (index >= 0 && index < _pages.length) {
            setState(() {
              _selectedIndex = index;
            });
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
