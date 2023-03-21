import 'package:flutter/material.dart';
import 'package:news_api/views/splash_view.dart';

class NewsWave extends StatelessWidget {
  const NewsWave({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SplashScreen(),
    );
  }
}
