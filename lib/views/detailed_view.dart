import 'package:flutter/material.dart';

class DetaildNews extends StatefulWidget {
  const DetaildNews({super.key});

  @override
  State<DetaildNews> createState() => _DetaildNewsState();
}

class _DetaildNewsState extends State<DetaildNews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.red,
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.orange,
            ),
          ),
        ],
      ),
    );
  }
}
