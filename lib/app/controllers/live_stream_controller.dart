import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class LiveStreamController extends GetxController {
  late YoutubePlayerController youtubeController;
  var isFullScreen = false.obs;
  var isLoading = true.obs;
  var liveMatch = {
    'team1': 'APF FC ',
    'team2': 'Church Boys',
    'team1_logo':
        'https://raw.githubusercontent.com/sangamsgit/Project-Football-Goldcup-Website/main/Assets/images/apf.jpg',
    'team2_logo':
        'https://raw.githubusercontent.com/sangamsgit/Project-Football-Goldcup-Website/refs/heads/main/Assets/images/chu.jpg',
    'time': '45:12',
    'venue': 'Old Trafford',
    'stream_url':
        'https://www.youtube.com/watch?v=lKYqE14kWkk', // Replace with actual live stream URL
  };

  void initializePlayer() {
    // Extract video ID from URL
    final videoId = YoutubePlayer.convertUrlToId(liveMatch['stream_url']!);

    if (videoId != null) {
      youtubeController = YoutubePlayerController(
        initialVideoId: videoId,
        flags: const YoutubePlayerFlags(
          autoPlay: true,
          mute: false,
          enableCaption: false,
          isLive: true, // Enable live stream mode
          forceHD: false, // Force HD quality when available
        ),
      );

      youtubeController.addListener(() {
        if (youtubeController.value.isReady) {
          isLoading.value = false;
        }
      });
    }
  }

  void toggleFullScreen() {
    isFullScreen.value = !isFullScreen.value;
  }

  @override
  void onClose() {
    youtubeController.dispose();
    super.onClose();
  }

  String getYouTubeThumbnailUrl() {
    RegExp regExp = RegExp(
        r"(?:(?:youtube\.com\/(?:[^\/]+\/.+\/|(?:v|e(?:mbed)?)\/|.*[?&]v=)|youtu\.be\/))([a-zA-Z0-9_-]{11})");
    Match? match = regExp.firstMatch(liveMatch['stream_url']!);
    if (match != null && match.groupCount >= 1) {
      return "https://img.youtube.com/vi/${match.group(1)}/maxresdefault.jpg";
    }
    return ""; // Return empty string if no match
  }
}
