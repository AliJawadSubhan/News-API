import 'dart:async';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:news_api/components/constants.dart';
import 'package:news_api/views/home_view.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool timerFinished = false;
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      setState(() {
        timerFinished = true;
      });

      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const HomeView(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'images/newspaper.png',
              height: 100,
              width: 100,
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DefaultTextStyle(
                  style: newsStyle,
                  child: AnimatedTextKit(
                    animatedTexts: [
                      WavyAnimatedText('News'),
                    ],
                    isRepeatingAnimation: true,
                  ),
                ),
                DefaultTextStyle(
                  style: waveStyle,
                  child: AnimatedTextKit(
                    animatedTexts: [
                      WavyAnimatedText('Wave'),
                    ],
                    isRepeatingAnimation: true,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30.0),
            Container(
              width: 120.0,
              height: 2.0,
              color: Colors.white,
            ),
            const SizedBox(height: 15.0),
            timerFinished
                ? const SizedBox()
                : const CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
          ],
        ),
      ),
    );
  }
}
