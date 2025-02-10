import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../controllers/live_stream_controller.dart';

class LiveStreamView extends StatelessWidget {
  final LiveStreamController controller = Get.put(LiveStreamController());

  LiveStreamView({super.key}) {
    controller.initializePlayer();
  }

  @override
  Widget build(BuildContext context) {
    controller.isFullScreen.value;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: YoutubePlayerBuilder(
          onExitFullScreen: () {
            controller.toggleFullScreen();
            SystemChrome.setPreferredOrientations([
              DeviceOrientation.portraitUp,
              DeviceOrientation.portraitDown,
            ]);
          },
          onEnterFullScreen: () {
            controller.toggleFullScreen();
            SystemChrome.setPreferredOrientations([
              DeviceOrientation.landscapeLeft,
              DeviceOrientation.landscapeRight,
            ]);
          },
          player: YoutubePlayer(
            controller: controller.youtubeController,
            showVideoProgressIndicator: true,
            progressColors: const ProgressBarColors(
              playedColor: Colors.red,
              handleColor: Colors.redAccent,
            ),
            onReady: () {
              controller.isLoading.value = false;
            },
            topActions: [
              const SizedBox(width: 8.0),
              IconButton(
                icon: const Icon(
                  Icons.fullscreen_exit,
                  color: Colors.white,
                ),
                onPressed: () {
                  controller.toggleFullScreen();
                  SystemChrome.setPreferredOrientations(
                      DeviceOrientation.values);
                },
              ),
            ],
            bottomActions: const [
              CurrentPosition(),
              ProgressBar(
                isExpanded: true,
                colors: const ProgressBarColors(
                  playedColor: Colors.red,
                  handleColor: Colors.redAccent,
                ),
              ),
              RemainingDuration(),
              const PlaybackSpeedButton(),
            ],
          ),
          builder: (context, player) => player,
        ),
      ),
    );
  }
}
