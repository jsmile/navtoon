class WebtoonModel {
  // {"id":"775141",
  //"title":"66666년 만에 환생한 흑마법사",
  // "thumb":"https://image-comic.pstatic.net/webtoon/775141/thumbnail/thumbnail_IMAG21_11d97e88-9ccf-4e7a-a10d-dde42725e3fa.jpg"
  // }
  final String id;
  final String title;
  final String thumb;

  WebtoonModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        thumb = json['thumb'];
}
