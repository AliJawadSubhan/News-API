import 'package:flutter/material.dart';
import 'package:news_api/views/detailed_view.dart';

class NewsItem extends StatelessWidget {
  const NewsItem({
    Key? key,
    required this.image,
    required this.headline,
    required this.author,
  }) : super(key: key);

  final String image;
  final String headline;
  final String author;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: GestureDetector(
        // onTap: () {
        //   Navigator.of(context).push(
        //     MaterialPageRoute(
        //       builder: (context) =>  DetaildNews(imageSrc: image,),
        //     ),
        //   );
        // },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  image: DecorationImage(
                    image: NetworkImage(
                      image,
                    ),
                    fit: BoxFit.cover,
                  )),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  // borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                      begin: Alignment.bottomRight,
                      stops: const [
                        0.1,
                        0.9,
                      ],
                      colors: [
                        Colors.black.withOpacity(.5),
                        Colors.black.withOpacity(.1)
                      ]),
                ),
              ),
            ),
            const SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    headline,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    author,
                    style: const TextStyle(
                      fontSize: 16.0,
                      color: Colors.grey,
                    ),
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
