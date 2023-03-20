import 'package:flutter/material.dart';

class DetaildNews extends StatefulWidget {
  const DetaildNews({super.key});

  @override
  State<DetaildNews> createState() => _DetaildNewsState();
}

class _DetaildNewsState extends State<DetaildNews> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      body: SafeArea(
        child: Stack(
          children: [
            SizedBox(
              // flex: 1,
              height: 300,
              child: Container(
                color: Colors.red,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 280.0),
              child: Container(
                height: size.height,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
