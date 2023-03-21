import 'package:flutter/material.dart';
import 'package:news_api/components/constants.dart';

class DetaildNews extends StatefulWidget {
  const DetaildNews({super.key, required this.imageSrc, required this.author, required this.desc, required this.content});
  final String imageSrc;
  final String author;
  final String desc;
  final String content;

  @override
  State<DetaildNews> createState() => _DetaildNewsState();
}

class _DetaildNewsState extends State<DetaildNews> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      // backgroundColor: Colors.orangeAccent,
      body: SafeArea(
        child: Stack(
          children: [
            SizedBox(
              // flex: 1,
              height: 300,
              child: Container(
                color: Colors.red,
                child: Image(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    widget.imageSrc,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 280.0),
              child: Container(
                padding: const EdgeInsets.all(28.0),
                height: size.height,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 70,
                          width: 20,
                          color: Colors.orange,
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Column(
                          children: [
                            SizedBox(height: 12,),
                            Text(
                              widget.author,
                              style: newsStyle.copyWith(
                                  color: Colors.black,
                                  fontSize: 24,
                                  letterSpacing: 0.00),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 40,),
                    Text(widget.desc),
                    const SizedBox(height: 40,),
                    Text(widget.content),
                    const SizedBox(height: 50,),

                    Container(
                      width: 120.0,
                      height: 2.0,
                      color: Colors.orange,
                    ),
                  ],

                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
