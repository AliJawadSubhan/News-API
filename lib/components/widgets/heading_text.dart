import 'package:flutter/material.dart';
import 'package:news_api/components/constants.dart';

class Heading extends StatelessWidget {
  const Heading({
    super.key,
    required this.mainText,
  });
  final String mainText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          mainText,
          style: newsStyle.copyWith(
              fontSize: 20, color: Colors.black, letterSpacing: 0.8),
        ),
        const Text(
          'See All',
          style: TextStyle(
              color: primaryColor, fontSize: 15, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
