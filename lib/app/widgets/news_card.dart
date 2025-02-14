import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewsCard extends StatelessWidget {
  final String image;
  final String description;
  final String title;

  NewsCard(
      {required this.image, required this.description, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start, // Align to top
        children: [
          // Image Section
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              image,
              width: MediaQuery.of(context).size.width * 0.40, // 40% width
              height: 80, // Fixed height for consistency
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 10), // Spacing between image and text

          // Text Section
          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start, // Align text to the start
              children: [
                Text(
                  title,
                  style:
                  
                   const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.bold),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis, // Truncate if too long
                ),
                const SizedBox(height: 5), // Spacing between category and title
                Text(
                  description,
                  style: const TextStyle(fontSize: 13),
                  maxLines: 2, // Allows up to 2 lines before truncation
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
