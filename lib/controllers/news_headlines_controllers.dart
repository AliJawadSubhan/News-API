// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:news_api/components/services/api_endpoint.dart';
// import '';
import 'package:http/http.dart' as http;
import 'package:news_api/model/news_headline_model.dart';

class NewsHeadlinesControllers {
  final Uri url = Uri.parse(ApiEndpoints.newsHeadlines + ApiEndpoints.apiKey);

  Future<NewsHeadlines> fetchingApi() async {
    final response = await http.get(url);
    final body = jsonDecode(response.body);
    try {
      if (response.statusCode == 200) {
        return NewsHeadlines.fromJson(body);
      }
    } catch (e) {
      print('Error fetching data: $e');
    }
    return NewsHeadlines.fromJson(body);
  }
}
