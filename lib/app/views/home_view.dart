import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gold_cup/app/views/calendar_view.dart';
import 'package:gold_cup/app/views/live_match.dart';
import 'package:gold_cup/app/views/news_view.dart';
import 'package:gold_cup/app/widgets/match_card.dart';
import '../controllers/home_controller.dart';

class HomeView extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());

   HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          appBar: AppBar(title: const Text('Gold Cup')),
          body: IndexedStack(
            index: controller.selectedIndex.value,
            children: [
              HomeContent(), // Main Home Page
              const NewsView(), // News Page
              const CalendarView(), // Calendar Page
              LiveMatch(), // Live Stream Page
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: controller.selectedIndex.value,
            onTap: (index) {
              controller.selectedIndex.value = index;
            },
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    color: Colors.black,
                  ),
                  label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.article,
                    color: Colors.black,
                  ),
                  label: 'News'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.calendar_today, color: Colors.black),
                  label: 'Calendar'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.live_tv, color: Colors.black),
                  label: 'Live'),
            ],
          ),
        ));
  }
}

// Home Content with Live Matches & Upcoming Matches
class HomeContent extends StatelessWidget {
  final HomeController controller = Get.find<HomeController>();

   HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Teams List (Scrollable Horizontally)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Teams',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                SizedBox(
                  height: 80,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.teams.length,
                    itemBuilder: (context, index) {
                      final team = controller.teams[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Column(
                          children: [
                            CircleAvatar(
                              backgroundImage: NetworkImage(team['logo']),
                              radius: 25,
                            ),
                            const SizedBox(height: 5),
                            Text(team['name'],
                                style: const TextStyle(fontSize: 14)),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),

          // Live Match Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Live Match',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                TextButton(
                  onPressed: () => Get.toNamed('/live'),
                  child: const Text('See All'),
                ),
              ],
            ),
          ),
          Obx(() => controller.liveMatch.isNotEmpty
              ? MatchCard(match: controller.liveMatch, isLive: true)
              : const Text("No live matches currently",
                  style: TextStyle(color: Colors.grey))),

          // Upcoming Matches
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Upcoming Matches',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                TextButton(onPressed: () {}, child: const Text('See All')),
              ],
            ),
          ),
          Obx(() => Column(
                children: controller.upcomingMatches
                    .map((match) => MatchCard(match: match, isLive: false))
                    .toList(),
              )),
        ],
      ),
    );
  }
}
