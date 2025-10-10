import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tourism_app/providers/index_nav_provider.dart';
import 'package:tourism_app/screens/bookmark/bookmark_screen.dart';
import 'package:tourism_app/screens/home/home_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  BottomNavigationBarItem _tabItem(Icon icon, String label, String tooltip) {
    return BottomNavigationBarItem(icon: icon, label: label, tooltip: tooltip);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<IndexNavProvider>(
        builder: (context, value, child) {
          return switch (value.indexBottomNavBar) {
            0 => HomeScreen(),
            _ => BookmarkScreen(),
          };
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: context.watch<IndexNavProvider>().indexBottomNavBar,
        onTap: (index) =>
            context.read<IndexNavProvider>().setIndexBottomNavBar = index,
        items: [
          _tabItem(Icon(Icons.home), 'Home', 'Home'),
          _tabItem(Icon(Icons.bookmark), 'Bookmarks', 'Bookmarks'),
        ],
      ),
    );
  }
}
