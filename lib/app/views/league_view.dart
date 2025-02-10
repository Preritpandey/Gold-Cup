import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/league_controller.dart';
import '../widgets/top_scorer_card.dart';

class LeagueView extends StatelessWidget {
  final LeagueController controller = Get.put(LeagueController());

  LeagueView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Most Goals')),
      body: Obx(() => ListView.builder(
            itemCount: controller.topScorers.length,
            itemBuilder: (context, index) {
              return TopScorerCard(scorer: controller.topScorers[index]);
            },
          )),
    );
  }
}
