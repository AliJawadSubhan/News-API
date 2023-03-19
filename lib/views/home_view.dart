import 'package:flutter/material.dart';
import 'package:news_api/components/constants.dart';
import 'package:news_api/components/widgets/heading_text.dart';
import 'package:news_api/components/widgets/news_headline.dart';
import 'package:news_api/components/widgets/top_headlines.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        elevation: 0.00,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'News',
              style: newsStyle.copyWith(fontSize: 28, color: Colors.black),
            ),
            Text(
              'Wave',
              style: waveStyle.copyWith(
                fontSize: 32,
              ),
            ),
            Image.asset(
              'images/newspaper.png',
              height: 55,
              width: 100,
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Column(
                children: [
                  const Heading(
                    mainText: 'Top-Headlines',
                  ),
                  SizedBox(
                    height: 250,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 4,
                        itemBuilder: (ctx, idx) {
                          return const TopHeadlines(
                            image:
                                'https://media.giphy.com/media/VX2Btre6lxmwGBABZ0/giphy.gif',
                            headlines:
                                'NBA Superstar, Indiana Jones is crying in her car with no clue',
                          );
                        }),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Container(
                    width: 120.0,
                    height: 2.0,
                    color: Colors.black,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const Heading(
                    mainText: 'News',
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  ...List.generate(
                    5,
                    (index) {
                      // [index] is the position in the generated list (from 0 up to 4 in this case)
                      return const NewsItem(
                        image:
                            'https://media.giphy.com/media/fTn01fiFdTd5pL60ln/giphy.gif',
                        headline: 'Joe was attacked again! Lmaooooo',
                        author: 'Jack Williams',
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
