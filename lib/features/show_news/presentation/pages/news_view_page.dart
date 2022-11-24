import 'package:flutter/material.dart';
import 'package:mynews_app_clean/core/constants/palette.dart';
import 'package:mynews_app_clean/features/show_news/domain/entities/news_info.dart';

class NewsViewPage extends StatelessWidget {
  final NewsInfo newsInfo;

  const NewsViewPage({super.key, required this.newsInfo});

  String _getDateInDDMMYYFormat(DateTime dateTime) {
    return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.background,
      appBar: AppBar(
        backgroundColor: Palette.background,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
            color: Palette.deepBlue,
            size: 20,
          ),
          onPressed: (() {
            Navigator.pop(context);
          }),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
        ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                newsInfo.title != null ? newsInfo.title! : '-- No title --',
                style: const TextStyle(
                  color: Palette.deepBlue,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                height: 300,
                color: Palette.lightGrey,
                child: newsInfo.imageURL != null
                    ? Image.network(
                        newsInfo.imageURL!,
                        fit: BoxFit.cover,
                      )
                    : const SizedBox(),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                _getDateInDDMMYYFormat(newsInfo.dateTime),
                style: const TextStyle(
                  color: Palette.lightGrey,
                  fontSize: 14,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                newsInfo.author != null ? newsInfo.author! : '-- No Author --',
                style: const TextStyle(
                  color: Palette.lightGrey,
                  fontSize: 14,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                newsInfo.content != null
                    ? newsInfo.content!
                    : '-- No CONTENT --',
                style: const TextStyle(
                  color: Palette.deepBlue,
                  fontSize: 14,
                ),
              ),
              const SizedBox(
                height: 32,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
