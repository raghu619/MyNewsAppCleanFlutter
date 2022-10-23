import 'package:flutter/material.dart';
import 'package:mynews_app_clean/core/constants/palette.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.background,
      appBar: AppBar(
        backgroundColor: Palette.background,
        elevation: 0.0,
        title: const Text(
          'News',
          style: TextStyle(
            color: Palette.deepBlue,
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
