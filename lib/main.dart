import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tourism_app/data/api/api_service.dart';
import 'package:tourism_app/providers/detail/bookmark_list_provider.dart';
import 'package:tourism_app/providers/detail/tourism_detail_provider.dart';
import 'package:tourism_app/providers/home/tourism_list_provider.dart';
import 'package:tourism_app/providers/index_nav_provider.dart';
import 'package:tourism_app/screens/detail/detail_screen.dart';
import 'package:tourism_app/screens/main/main_screen.dart';
import 'package:tourism_app/static/navigation_route.dart';
import 'package:tourism_app/style/theme/tourism_theme.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => IndexNavProvider()),
        ChangeNotifierProvider(create: (context) => BookmarkListProvider()),
        Provider(create: (context) => ApiService()),
        ChangeNotifierProvider(
          create: (context) => TourismListProvider(context.read<ApiService>()),
        ),
        ChangeNotifierProvider(
          create: (context) =>
              TourismDetailProvider(context.read<ApiService>()),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tourism App',
      theme: TourismTheme.lightTheme,
      darkTheme: TourismTheme.darkTheme,
      themeMode: ThemeMode.system,
      initialRoute: NavigationRoute.mainRoute.name,
      routes: {
        NavigationRoute.mainRoute.name: (context) => MainScreen(),
        NavigationRoute.detailRoute.name: (context) => DetailScreen(
          placeId: ModalRoute.of(context)?.settings.arguments as int,
        ),
      },
    );
  }
}
