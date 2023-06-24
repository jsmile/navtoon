import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:navtoon/models/webtoon_model.dart';

import '../models/webtoon_detail_model.dart';
import '../models/webtoon_episode_model.dart';

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
      return webtoonModels; // 동기형 data를 비동기형 data로 변환가능 반대 방향은 불가.
    }
    throw Exception('webtoonModels data load failed');
  }

  static Future<WebtoonDetailModel> getWebtoonDetailById(String id) async {
    final url = Uri.parse('$baseUrl/$id');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final detailJsonMap = jsonDecode(response.body);
      return WebtoonDetailModel.fromJson(detailJsonMap);
    }
    throw Exception('WebtoonDetailModel data load failed');
  }

  static Future<List<WebtoonEpisodeModel>> getWebtoonEpisodesById(
      String id) async {
    List<WebtoonEpisodeModel> webtoonEpisodes = [];
    final url = Uri.parse('$baseUrl/$id/episodes');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final dWebtoonEpisodes = jsonDecode(response.body);
      for (var webtoonEpisode in dWebtoonEpisodes) {
        webtoonEpisodes.add(WebtoonEpisodeModel.fromJson(webtoonEpisode));
      }
      return webtoonEpisodes;
    }
    throw Exception('WebtoonEpisodeModel data load failed');
  }
}
