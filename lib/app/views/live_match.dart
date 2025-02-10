import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gold_cup/app/controllers/live_stream_controller.dart';
import 'package:gold_cup/app/views/live_stream_view.dart';

class LiveMatch extends StatelessWidget {
  final LiveStreamController controller = Get.put(LiveStreamController());
  LiveMatch({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      // Match Information
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Image.network(controller.liveMatch['team1_logo']!, height: 50),
              const SizedBox(height: 8),
              Text(controller.liveMatch['team1']!,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold)),
            ],
          ),
          Column(
            children: [
              Text(
                "Live ${controller.liveMatch['time']}",
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.red),
              ),
              const SizedBox(height: 8),
              Text(controller.liveMatch['venue']!,
                  style: const TextStyle(fontSize: 14, color: Colors.grey)),
            ],
          ),
          Column(
            children: [
              Image.network(controller.liveMatch['team2_logo']!, height: 50),
              const SizedBox(height: 8),
              Text(controller.liveMatch['team2']!,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold)),
            ],
          ),
        ],
      ),
      IconButton(
          onPressed: () => Get.to(LiveStreamView()),
          icon: Image.network(controller.getYouTubeThumbnailUrl())),
    ]);
  }
}
