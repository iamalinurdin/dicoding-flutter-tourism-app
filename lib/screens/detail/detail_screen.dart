import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tourism_app/models/tourims_model.dart';
import 'package:tourism_app/providers/detail/bookmark_icon_provider.dart';
import 'package:tourism_app/screens/detail/bookmark_icon_widget.dart';

class DetailScreen extends StatelessWidget {
  final Tourism tourism;

  const DetailScreen({super.key, required this.tourism});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tourism Detail'),
        actions: [
          ChangeNotifierProvider(
            create: (context) => BookmarkIconProvider(),
            child: BookmarkIconWidget(tourism: tourism),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Image.network(tourism.image, fit: BoxFit.cover),
              SizedBox.square(dimension: 16),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          tourism.name,
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                        Text(
                          tourism.address,
                          style: Theme.of(context).textTheme.labelLarge
                              ?.copyWith(fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.favorite),
                  SizedBox.square(dimension: 4),
                  Text(
                    tourism.like.toString(),
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
              SizedBox.square(dimension: 16),
              Text(
                tourism.description,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
