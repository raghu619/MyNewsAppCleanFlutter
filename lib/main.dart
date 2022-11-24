import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mynews_app_clean/core/constants/palette.dart';
import 'package:mynews_app_clean/core/services_locator.dart';
import 'package:mynews_app_clean/features/show_news/presentation/news_cubit/news_cubit.dart';
import 'features/show_news/presentation/pages/home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setUpServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) {
          return NewsCubit();
        }),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            primarySwatch: Colors.blue,
            colorScheme: const ColorScheme.light().copyWith(
              secondary: Palette.deepBlue,
            ),
            fontFamily: 'Poppins'),
        home: const HomePage(),
      ),
    );
  }
}
