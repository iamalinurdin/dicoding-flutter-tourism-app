import 'package:flutter/material.dart';
import 'package:tourism_app/models/tourims_model.dart';
import 'package:tourism_app/screens/home/home_screen.dart';
import 'package:tourism_app/screens/home/tourism_card_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomeScreen(),
    );
  }
}
