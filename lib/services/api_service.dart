import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = 'https://webtoon-crawler.nomadcoders.workers.dev';
  final String today = 'today';

  void getTodayWebtoons() async {
    final Uri url = Uri.parse('$baseUrl/$today');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      debugPrint('\n*** response.body : ${response.body}');
      return;
    }
    throw Exception('Failed to load data');
  }
}
