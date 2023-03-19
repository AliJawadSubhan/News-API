import 'package:flutter/material.dart';
import 'package:news_api/views/detailed_view.dart';
import 'package:news_api/views/home_view.dart';
import 'package:news_api/views/splash_view.dart';

class NewsWave extends StatelessWidget {
  const NewsWave({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/home_view': (context) => const HomeView(),
        '/detail_view': (context) => const DetaildNews(),
      },
    );
  }
}
