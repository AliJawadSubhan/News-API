



import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_api/components/services/api_endpoint.dart';
import 'package:news_api/model/top_headline_model.dart';

class TopHeadlineController {

  final Uri url = Uri.parse(ApiEndpoints.topHeadlines + ApiEndpoints.apiKey);

  Future fetchingApi () async {
   final response = await http.get(url);
   final body = jsonDecode(response.body);
   try {
     if(response.statusCode == 200) {
       return TopHeadline.fromJson(body);
     }
   } catch (e) {
     print('Error fetching data: $e');
   }
  }
}