import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:json_serialization/Model/NewsModel.dart';

class News_Model_API_Manager {
  Future<NewsModel> getNews() async {
    var response = await http.get(
        'http://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=7a82b3a9de2e424ba91e5d58d21362ef');
    if (response.statusCode == 200) {
      var jsonString = response.body;
      var jsonMap = json.decode(jsonString);
      return NewsModel.fromJson(jsonMap);
    } else {
      throw Exception('Failed to load data');
    }
  }
}
