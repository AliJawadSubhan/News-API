import 'package:flutter/material.dart';
import 'package:news_api/components/constants.dart';
import 'package:news_api/components/widgets/heading_text.dart';
import 'package:news_api/components/widgets/news_headline.dart';
import 'package:news_api/components/widgets/top_headlines.dart';
import 'package:news_api/controllers/news_headlines_controllers.dart';
import 'package:news_api/controllers/top_headlines_controller.dart';
import 'package:news_api/views/detailed_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    topHeadlineController.fetchingApi();
    newsheadlineController.fetchingApi();
  }

  TopHeadlineController topHeadlineController = TopHeadlineController();

  final newsheadlineController = NewsHeadlinesControllers();

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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            children: [
              const Heading(
                mainText: 'Top-Headlines',
              ),
              SizedBox(
                height: 250,
                child: FutureBuilder(
                    future: topHeadlineController.fetchingApi(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            CircularProgressIndicator(
                              color: Colors.black,
                            ),
                          ],
                        );
                      } else if (snapshot.connectionState ==
                          ConnectionState.done) {
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data!.articles!.length,
                          itemBuilder: (ctx, idx) {
                            return TopHeadlines(
                              ontap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => DetaildNews(
                                      imageSrc: snapshot
                                          .data!.articles![idx].urlToImage
                                          .toString(),
                                      author: snapshot
                                          .data!.articles![idx].source!.name
                                          .toString(),
                                      desc: snapshot
                                          .data!.articles![idx].description
                                          .toString(),
                                      content: snapshot
                                          .data!.articles![idx].content
                                          .toString(),
                                    ),
                                  ),
                                );
                              },
                              name: snapshot.data!.articles![idx].source!.name
                                  .toString(),
                              image: snapshot.data!.articles![idx].urlToImage ??
                                  'https://www.videogameschronicle.com/files/2021/06/xbox-cloud-gaming-d.jpg',
                              headlines: snapshot.data!.articles![idx].title
                                  .toString(),
                            );
                          },
                        );
                      }
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text('I Think the Api or your internet is shi'),
                        ],
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
              FutureBuilder(
                future: newsheadlineController.fetchingApi(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const SizedBox(
                      height: 70,
                      width: 70,
                      child: CircularProgressIndicator(
                        color: Colors.black,
                      ),
                    );
                  } else if (snapshot.connectionState == ConnectionState.done) {
                    return Expanded(
                      child: ListView.builder(
                        // physics: NeverS,
                        itemCount: snapshot.data!.articles!.length,
                        itemBuilder: (context, index) => NewsItem(
                          ontap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => DetaildNews(
                                  imageSrc: snapshot
                                      .data!.articles![index].urlToImage
                                      .toString(),
                                  author: snapshot
                                      .data!.articles![index].source!.name
                                      .toString(),
                                  desc: snapshot
                                      .data!.articles![index].description
                                      .toString(),
                                  content: snapshot
                                      .data!.articles![index].content
                                      .toString(),
                                ),
                              ),
                            );
                          },
                          image: snapshot.data!.articles?[index].urlToImage
                                  .toString() ??
                              'images/newspaper.png',
                          headline:
                              snapshot.data!.articles![index].title.toString(),
                          author: snapshot.data!.articles![index].source!.name
                              .toString(),
                        ),
                      ),
                    );
                  }
                  return const Text('I Think the Api or your internet is shi');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
// ...allNews.map(

//                     (item) {
//                       // [index] is the position in the generated list (from 0 up to 4 in this case)
//                       return const NewsItem(
//                         image:
//                             'https://media.giphy.com/media/fTn01fiFdTd5pL60ln/giphy.gif',
//                         headline: 'Joe was attacked again! Lmaooooo',
//                         author: 'Jack Williams',
//                       );
//                     },
//                   ).toList(),