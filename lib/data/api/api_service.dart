import 'package:http/http.dart' as http;
import 'package:tourism_app/data/models/tourism_detail_response.dart';
import 'dart:convert';

import 'package:tourism_app/data/models/tourism_list_response.dart';

class ApiService {
  static const String _baseUrl = 'https://tourism-api.dicoding.dev';

  Future<TourismListResponse> getTourismList() async {
    final response = await http.get(Uri.parse('$_baseUrl/list'));

    if (response.statusCode == 200) {
      return TourismListResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('failed to load tourism list');
    }
  }

  Future<TourismDetailResponse> getTourismDetail(int id) async {
    final response = await http.get(Uri.parse('$_baseUrl/detail/$id'));

    if (response.statusCode == 200) {
      return TourismDetailResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('failed to load place');
    }
  }
}
