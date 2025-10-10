import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tourism_app/providers/home/tourism_list_provider.dart';
import 'package:tourism_app/screens/home/tourism_card_widget.dart';
import 'package:tourism_app/static/navigation_route.dart';
import 'package:tourism_app/static/tourism_list_result_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      context.read<TourismListProvider>().fetchTourismList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tourism List")),
      body: Consumer<TourismListProvider>(
        builder: (context, value, child) {
          return switch (value.resultState) {
            TourismListLoadingState() => Center(
              child: CircularProgressIndicator(),
            ),
            TourismListLoadedState(data: var tourismList) => ListView.builder(
              itemBuilder: (context, index) {
                final place = tourismList[index];

                return TourismCard(
                  tourism: place,
                  onTap: () => Navigator.pushNamed(
                    context,
                    NavigationRoute.detailRoute.name,
                    arguments: place.id,
                  ),
                );
              },
              itemCount: tourismList.length,
            ),
            TourismListErrorState(error: var message) => Center(
              child: Text(message),
            ),
            _ => SizedBox(),
          };
        },
      ),
    );
  }
}
