import 'package:flutter/material.dart';
import 'package:tourism_app/models/tourims_model.dart';
import 'package:tourism_app/screens/detail/detail_screen.dart';
import 'package:tourism_app/screens/home/home_screen.dart';
import 'package:tourism_app/screens/home/tourism_card_widget.dart';
import 'package:tourism_app/static/navigation_route.dart';

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
      initialRoute: NavigationRoute.homeRoute.name,
      routes: {
        NavigationRoute.homeRoute.name: (context) => HomeScreen(),
        NavigationRoute.detailRoute.name: (context) => DetailScreen(
          tourism: ModalRoute.of(context)?.settings.arguments as Tourism,
        ),
      },
    );
  }
}
