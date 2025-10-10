import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tourism_app/data/api/api_service.dart';
import 'package:tourism_app/data/models/tourims_model.dart';
import 'package:tourism_app/data/models/tourism_detail_response.dart';
import 'package:tourism_app/providers/detail/bookmark_icon_provider.dart';
import 'package:tourism_app/providers/detail/tourism_detail_provider.dart';
import 'package:tourism_app/screens/detail/body_of_detail_screen_widget.dart';
import 'package:tourism_app/screens/detail/bookmark_icon_widget.dart';
import 'package:tourism_app/static/tourism_detail_result_state.dart';

class DetailScreen extends StatefulWidget {
  final int placeId;

  const DetailScreen({super.key, required this.placeId});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final Completer<Tourism> _completerPlace = Completer<Tourism>();
  late Future<TourismDetailResponse> _futureDetailPlace;

  @override
  void initState() {
    // _futureDetailPlace = ApiService().getTourismDetail(widget.placeId);
    Future.microtask(() {
      context.read<TourismDetailProvider>().fetchTourismDetail(widget.placeId);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tourism Detail'),
        actions: [
          ChangeNotifierProvider(
            create: (context) => BookmarkIconProvider(),
            child: Consumer<TourismDetailProvider>(
              builder: (context, value, child) {
                return switch (value.resultState) {
                  TourismDetailLoadedState(data: var place) =>
                    BookmarkIconWidget(tourism: place),
                  _ => SizedBox(),
                };
              },
            ),
          ),
        ],
      ),
      body: Consumer<TourismDetailProvider>(
        builder: (context, value, child) {
          return switch (value.resultState) {
            TourismDetailLoadingState() => Center(
              child: CircularProgressIndicator(),
            ),
            TourismDetailLoadedState(data: var place) =>
              BodyOfDetailScreenWidget(place: place),
            TourismDetailErrorState(error: var message) => Center(
              child: Text(message),
            ),
            _ => SizedBox(),
          };
        },
      ),
    );
  }
}
