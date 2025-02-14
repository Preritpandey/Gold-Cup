import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gold_cup/app/controllers/news_controller.dart';
import 'package:gold_cup/app/widgets/news_card.dart';
import 'package:google_fonts/google_fonts.dart';

class NewsView extends StatelessWidget {
  const NewsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 238, 230, 230),
      body: NewsScreen(),
    );
  }
}

class NewsScreen extends StatelessWidget {
  final NewsController newsController = Get.put(NewsController());

  NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 248, 244, 244),
      body: Padding(
        padding: const EdgeInsets.all(0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'News',
                    style: GoogleFonts.poppins(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16.0),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey.shade200,
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Filter', style: TextStyle(fontWeight: FontWeight.bold)),
                  Icon(Icons.arrow_drop_down),
                ],
              ),
            ),
            const SizedBox(height: 16.0),
            Expanded(
              child: Obx(() {
                if (newsController.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (newsController.newsList.isEmpty) {
                  return const Center(child: Text("No news available"));
                }
                return ListView.builder(
                  itemCount: newsController.newsList.length,
                  itemBuilder: (context, index) {
                    var news = newsController.newsList[index];
                    return NewsCard(
                      image: news.image,
                      title: news.title,
                      description: news.description,
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
