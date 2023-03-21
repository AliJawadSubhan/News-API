import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TopHeadlines extends StatelessWidget {
  const TopHeadlines(
      {Key? key,
      required this.image,
      required this.headlines,
      required this.name,
      required this.ontap})
      : super(key: key);
  final String image;
  final String headlines;
  final String name;
  final VoidCallback ontap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: AspectRatio(
        aspectRatio: 2 / 2.15,
        child: Container(
          margin: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: Colors.orange,
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(image),
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                  begin: Alignment.bottomRight,
                  stops: const [
                    0.2,
                    0.9
                  ],
                  colors: [
                    Colors.black.withOpacity(.8),
                    Colors.black.withOpacity(.1)
                  ]),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0),
                  child: Text(
                    name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style:
                        GoogleFonts.lato(color: Colors.white54, fontSize: 20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    headlines,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.lato(color: Colors.white, fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
