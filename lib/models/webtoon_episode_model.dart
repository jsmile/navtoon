class WebtoonEpisodeModel {
  final String id, title, rating, date;

  WebtoonEpisodeModel({
    required this.id,
    required this.title,
    required this.rating,
    required this.date,
  });

  WebtoonEpisodeModel.fromJson(Map<String, dynamic> jsonMap)
      : id = jsonMap['id'],
        title = jsonMap['title'],
        rating = jsonMap['rating'],
        date = jsonMap['date'];
}
