import 'package:flutter/material.dart';
import 'package:navtoon/models/webtoon_detail_model.dart';
import 'package:navtoon/models/webtoon_episode_model.dart';
import 'package:navtoon/services/api_service.dart';

class DetailScreen extends StatefulWidget {
  final String id, title, thumb;

  const DetailScreen({
    super.key,
    required this.id,
    required this.title,
    required this.thumb,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late Future<WebtoonDetailModel> webtoonDetail;
  late Future<List<WebtoonEpisodeModel>> webtoonEpisodes;

  @override
  void initState() {
    super.initState();

    webtoonDetail = ApiService.getWebtoonDetailById(widget.id);
    webtoonEpisodes = ApiService.getWebtoonEpisodesById(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
        title: Text(
          widget.title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        elevation: 2,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Hero(
              tag: widget.id,
              child: Container(
                width: 180,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 10,
                        offset: const Offset(5, 5),
                      ),
                    ]),
                child: Image.network(
                  widget.thumb,
                  headers: const {
                    'Referer': 'https://comic.naver.com', // 403 오류 방지
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(widget.title),
          ],
        ),
      ),
    );
  }
}
