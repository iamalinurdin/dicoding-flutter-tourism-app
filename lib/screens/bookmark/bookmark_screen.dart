import 'package:flutter/material.dart';
import 'package:tourism_app/models/tourims_model.dart';
import 'package:tourism_app/screens/home/tourism_card_widget.dart';
import 'package:tourism_app/static/navigation_route.dart';

class BookmarkScreen extends StatelessWidget {
  const BookmarkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Bookmark List')),
      body: ListView.builder(
        itemBuilder: (context, index) => TourismCard(
          tourism: bookmarkTourismList[index],
          onTap: () => Navigator.pushNamed(
            context,
            NavigationRoute.detailRoute.name,
            arguments: bookmarkTourismList[index],
          ),
        ),
        itemCount: bookmarkTourismList.length,
      ),
    );
  }
}
