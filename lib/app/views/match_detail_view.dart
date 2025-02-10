import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/match_controller.dart';

class MatchDetailView extends StatelessWidget {
  final MatchController controller = Get.put(MatchController());

   MatchDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const  Text('Match Details')),
      body: Column(
        children: [
       const Text('Statistics', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Obx(() => Column(
                children: [
                  Text('Shots: ${controller.matchStats['shots']![0]} - ${controller.matchStats['shots']![1]}'),
                  Text('On Goal: ${controller.matchStats['onGoal']![0]} - ${controller.matchStats['onGoal']![1]}'),
                  Text('Possession: ${controller.matchStats['possession']![0]}% - ${controller.matchStats['possession']![1]}%'),
                ],
              )),
        ],
      ),
    );
  }
}
