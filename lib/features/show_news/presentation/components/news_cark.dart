import 'package:flutter/material.dart';
import 'package:mynews_app_clean/core/constants/palette.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300.0,
      width: MediaQuery.of(context).size.width - (2 * 16),
      child: Stack(
        children: [
          Container(
            height: 260.0,
            color: Palette.lightGrey,
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
                    style: TextStyle(
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
    );
  }
}
