import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:navtoon/models/webtoon_model.dart';

class ApiService {
  static const String baseUrl =
      'https://webtoon-crawler.nomadcoders.workers.dev';
  static const String today = 'today';

  static Future<List<WebtoonModel>> getTodayWebtoons() async {
    final url = Uri.parse('$baseUrl/$today');
    final response = await http.get(url);
    final List<WebtoonModel> webtoonModels = [];

    if (response.statusCode == 200) {
      final List<dynamic> dWebtoonJsons = jsonDecode(response.body);
      for (var webtoonJson in dWebtoonJsons) {
        webtoonModels.add(WebtoonModel.fromJson(webtoonJson));
      }
      // debugPrint('\n*** webtoonModels : $webtoonModels');
      return webtoonModels;
    }
    throw Exception('Failed to load data');
  }
}
