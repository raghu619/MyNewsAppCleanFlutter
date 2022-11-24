import 'package:flutter/material.dart';
import 'package:mynews_app_clean/core/constants/palette.dart';
import 'package:mynews_app_clean/features/show_news/domain/entities/news_info.dart';
import 'package:mynews_app_clean/features/show_news/presentation/pages/news_view_page.dart';

class NewsCard extends StatelessWidget {
  final NewsInfo newsInfo;
  const NewsCard({super.key, required this.newsInfo});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return NewsViewPage(newsInfo: newsInfo);
          }),
        );
      }),
      child: Container(
        margin: const EdgeInsets.only(bottom: 16.0),
        height: 300.0,
        width: MediaQuery.of(context).size.width - (2 * 16),
        child: Expanded(
          child: Stack(
            children: [
              Container(
                height: 260.0,
                color: Palette.lightGrey,
                child: newsInfo.imageURL != null
                    ? Image.network(
                        newsInfo.imageURL!,
                        fit: BoxFit.cover,
                      )
                    : const SizedBox(),
              ),
              Positioned(
                left: 16.0,
                right: 16.0,
                bottom: 0.0,
                child: Container(
                  height: 80.0,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0.0, 2.0),
                          blurRadius: 4.0,
                          color: Colors.black12),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Center(
                      child: Text(
                        newsInfo.title != null
                            ? newsInfo.title!
                            : '-- No title --',
                        maxLines: 2,
                        style: const TextStyle(
                          overflow: TextOverflow.ellipsis,
                          color: Palette.deepBlue,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
