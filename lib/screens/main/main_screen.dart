import 'package:flutter/material.dart';
import 'package:tourism_app/screens/bookmark/bookmark_screen.dart';
import 'package:tourism_app/screens/home/home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _indexBottomNavBar = 0;

  BottomNavigationBarItem _tabItem(Icon icon, String label, String tooltip) {
    return BottomNavigationBarItem(icon: icon, label: label, tooltip: tooltip);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: switch (_indexBottomNavBar) {
        0 => HomeScreen(),
        _ => BookmarkScreen(),
      },
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indexBottomNavBar,
        onTap: (value) {
          setState(() {
            _indexBottomNavBar = value;
          });
        },
        items: [
          _tabItem(Icon(Icons.home), 'Home', 'Home'),
          _tabItem(Icon(Icons.bookmark), 'Bookmarks', 'Bookmarks'),
        ],
      ),
    );
  }
}
