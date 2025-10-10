import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tourism_app/providers/detail/bookmark_list_provider.dart';
import 'package:tourism_app/screens/home/tourism_card_widget.dart';
import 'package:tourism_app/static/navigation_route.dart';

class BookmarkScreen extends StatelessWidget {
  const BookmarkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Bookmark List')),
      body: Consumer<BookmarkListProvider>(
        builder: (context, value, child) {
          final bookmarks = value.bookmarkList;

          return switch (bookmarks.isNotEmpty) {
            true => ListView.builder(
              itemBuilder: (context, index) => TourismCard(
                tourism: value.bookmarkList[index],
                onTap: () => Navigator.pushNamed(
                  context,
                  NavigationRoute.detailRoute.name,
                  arguments: value.bookmarkList[index],
                ),
              ),
              itemCount: value.bookmarkList.length,
            ),
            _ => const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text("No Bookmarked")],
              ),
            ),
          };
        },
      ),
    );
  }
}
