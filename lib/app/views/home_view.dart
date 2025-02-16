import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gold_cup/app/views/calendar_view.dart';
import 'package:gold_cup/app/views/live_match.dart';
import 'package:gold_cup/app/views/news_view.dart';
import 'package:gold_cup/app/widgets/live_match_card.dart';
import 'package:gold_cup/app/widgets/match_card.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/home_controller.dart';

class HomeView extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());

  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          backgroundColor: const Color.fromARGB(255, 238, 230, 230),
          appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 238, 230, 230),
            leading: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.menu,
                  color: Color.fromARGB(200, 21, 20, 41),
                )),
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.search,
                    color: Color.fromARGB(200, 21, 20, 41),
                  ))
            ],
            centerTitle: true,
            title: Text('Gold Cup',
                style: GoogleFonts.poppins(
                    color: const Color.fromARGB(200, 21, 20, 41),
                    fontSize: 15,
                    fontWeight: FontWeight.bold)),
          ),
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
            items: [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    color: controller.selectedIndex.value == 0
                        ? Colors.black
                        : Colors.grey,
                  ),
                  label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.article,
                    color: controller.selectedIndex.value == 1
                        ? Colors.black
                        : Colors.grey,
                  ),
                  label: 'News'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.calendar_today,
                    color: controller.selectedIndex.value == 2
                        ? Colors.black
                        : Colors.grey,
                  ),
                  label: 'Calendar'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.live_tv,
                    color: controller.selectedIndex.value == 3
                        ? Colors.black
                        : Colors.grey.shade700,
                  ),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Teams List (Scrollable Horizontally)
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.015,
                vertical: MediaQuery.of(context).size.height * 0.012),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Teams',
                    style: GoogleFonts.poppins(
                        fontSize: 18, fontWeight: FontWeight.bold)),
                SizedBox(height: MediaQuery.of(context).size.height * 0.015),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
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
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.014),
            child: LiveMatchList(),
          ),
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
