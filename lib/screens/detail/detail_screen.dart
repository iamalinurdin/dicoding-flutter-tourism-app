import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tourism_app/data/api/api_service.dart';
import 'package:tourism_app/data/models/tourims_model.dart';
import 'package:tourism_app/data/models/tourism_detail_response.dart';
import 'package:tourism_app/providers/detail/bookmark_icon_provider.dart';
import 'package:tourism_app/screens/detail/body_of_detail_screen_widget.dart';
import 'package:tourism_app/screens/detail/bookmark_icon_widget.dart';

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
    _futureDetailPlace = ApiService().getTourismDetail(widget.placeId);
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
            child: FutureBuilder(
              future: _completerPlace.future,
              builder: (context, snapshot) {
                return switch (snapshot.connectionState) {
                  ConnectionState.done => BookmarkIconWidget(
                    tourism: snapshot.data!,
                  ),
                  _ => SizedBox(),
                };
              },
            ),
          ),
        ],
      ),
      body: FutureBuilder(
        future: _futureDetailPlace,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
            case ConnectionState.done:
              if (snapshot.hasError) {
                return Center(child: Text(snapshot.error.toString()));
              }

              final place = snapshot.data!.place;

              _completerPlace.complete(place);
              return BodyOfDetailScreenWidget(place: place);
            default:
              return SizedBox();
          }
        },
      ),
    );
  }
}
