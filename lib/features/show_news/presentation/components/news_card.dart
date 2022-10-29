import 'package:flutter/material.dart';
import 'package:mynews_app_clean/core/constants/palette.dart';
import 'package:mynews_app_clean/features/show_news/presentation/news_view_page.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return const NewsViewPage();
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
                child: Image.network(
                  'https://elements-cover-images-0.imgix.net/0f478ac6-76ca-4281-a339-a5d08004ad87?auto=compress%2Cformat&fit=max&w=1370&s=ee5a0253b0c57f7dcc81151b0d1ee18c',
                  fit: BoxFit.cover,
                ),
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
                  child: const Padding(
                    padding: EdgeInsets.all(16),
                    child: Center(
                      child: Text(
                        'News Title',
                        maxLines: 2,
                        style: TextStyle(
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
