import 'package:flutter/material.dart';
import 'package:mynews_app_clean/core/constants/palette.dart';
import 'package:mynews_app_clean/features/show_news/presentation/news_cubit/news_cubit.dart';
import 'package:mynews_app_clean/features/show_news/presentation/pages/components/news_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<NewsCubit>().fetchNews(null);
  }

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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TextField(
              style: TextStyle(
                color: Palette.deepBlue,
                fontSize: 14.0,
              ),
              cursorColor: Palette.deepBlue,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.search,
                  color: Palette.lightGrey,
                  size: 20.0,
                ),
                hintText: 'Search',
                hintStyle: TextStyle(
                  color: Palette.lightGrey,
                  fontSize: 14.0,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Palette.lightGrey,
                    width: 1.0,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Palette.deepBlue,
                    width: 2.0,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            const Text(
              'Top News',
              style: TextStyle(
                  color: Palette.deepBlue,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 16.0,
            ),
            Expanded(
              child: BlocBuilder<NewsCubit, NewsState>(
                builder: (context, state) {
                  if (state is NewsInitial) {
                    return ListView.builder(
                      itemCount: state.news.length,
                      itemBuilder: (context, index) {
                        return NewsCard(newsInfo: state.news[index]);
                      },
                    );
                  } else if (state is NewsLoading) {
                    return const Center(
                      child: CircularProgressIndicator(color: Palette.deepBlue),
                    );
                  } else {
                    return const Center(child: Text('Error'));
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
