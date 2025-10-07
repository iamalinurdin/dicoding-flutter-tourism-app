import 'package:flutter/material.dart';
import 'package:tourism_app/models/tourims_model.dart';

class DetailScreen extends StatelessWidget {
  final Tourism tourism;

  const DetailScreen({super.key, required this.tourism});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tourism Detail')),
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
                        Text(tourism.name, style: TextStyle(fontSize: 18)),
                        Text(tourism.address, style: TextStyle(fontSize: 12)),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.favorite),
                  SizedBox.square(dimension: 4),
                  Text(tourism.like.toString()),
                ],
              ),
              SizedBox.square(dimension: 16),
              Text(tourism.description),
            ],
          ),
        ),
      ),
    );
  }
}
