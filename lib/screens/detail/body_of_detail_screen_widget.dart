import 'package:flutter/material.dart';
import 'package:tourism_app/data/models/tourims_model.dart';

class BodyOfDetailScreenWidget extends StatelessWidget {
  final Tourism place;

  const BodyOfDetailScreenWidget({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Image.network(place.image, fit: BoxFit.cover),
            SizedBox.square(dimension: 16),
            Row(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        place.name,
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      Text(
                        place.address,
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          fontWeight: FontWeight.w400,
                        ),
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
                  place.like.toString(),
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
            SizedBox.square(dimension: 16),
            Text(
              place.description,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}
