import 'package:flutter/material.dart';
import 'package:gold_cup/app/widgets/news_card.dart';

class NewsView extends StatelessWidget {
  const NewsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 238, 230, 230),
      body: NewsScreen(),
    );
  }
}

class NewsScreen extends StatelessWidget {
  final List<Map<String, String>> newsItems = [
    {
      'image':
          'https://english.makalukhabar.com/wp-content/uploads/2023/06/khel-mk-8.jpg',
      'category': 'More than a game',
      'title':
          'Hartlepool hero gets Premier League award for helping young and old'
    },
    {
      'image':
          'https://english.makalukhabar.com/wp-content/uploads/2023/03/KhumaltarVSFriends_MK-1.jpg',
      'category': 'More than a game',
      'title': 'New Premier League resources to help children stay safe online'
    },
    {
      'image':
          'https://republicaimg.nagariknewscdn.com/shared/web/uploads/media/Martyr-s-Memorial-Trophy--.jpg',
      'category': 'Feature',
      'title': "Who's leading the chase for 2024/25 Golden awards?"
    },
    {
      'image':
          'https://thehimalayantimes.com/uploads/imported_images/wp-content/uploads/2020/02/Bagmati-Gold-Cup.jpg',
      'category': 'Feature',
      'title': 'Preview: All you need to know ahead of Man City v Real Madrid'
    },
  ];

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
                  const Text('News',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      prefixIcon: Icon(Icons.search),
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
              child: ListView.builder(
                itemCount: newsItems.length,
                itemBuilder: (context, index) {
                  return NewsCard(
                    image: newsItems[index]['image']!,
                    category: newsItems[index]['category']!,
                    title: newsItems[index]['title']!,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
