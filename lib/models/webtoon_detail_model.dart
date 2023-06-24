class WebtoonDetailModel {
  final String title, about, genre, age;

  WebtoonDetailModel({
    required this.title,
    required this.about,
    required this.genre,
    required this.age,
  });

  WebtoonDetailModel.fromJson(Map<String, dynamic> jsonMap)
      : title = jsonMap['title'],
        about = jsonMap['about'],
        genre = jsonMap['genre'],
        age = jsonMap['age'];
}
