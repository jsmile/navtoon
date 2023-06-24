import 'package:flutter/material.dart';

import 'detail_catoon_widget.dart';

class WebtoonCard extends StatelessWidget {
  final String id, title, thumb;

  const WebtoonCard({
    super.key,
    required this.id,
    required this.title,
    required this.thumb,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailCatoon(
                // Card 상세보기
                id: id,
                title: title,
                thumb: thumb,
              ),
              fullscreenDialog: true,
            ));
      },
      child: Column(
        children: [
          Hero(
            tag: id,
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
                thumb,
                headers: const {
                  'Referer': 'https://comic.naver.com', // 403 오류 방지
                },
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(title),
        ],
      ),
    );
  }
}
