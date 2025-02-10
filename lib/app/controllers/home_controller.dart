import 'package:get/get.dart';

class HomeController extends GetxController {
  var selectedIndex = 0.obs; // For bottom navigation

  var liveMatch = {}.obs;
  var upcomingMatches = <Map>[].obs;
  var teams = <Map>[].obs; // Team list

  @override
  void onInit() {
    super.onInit();
    fetchLiveMatch();
    fetchUpcomingMatches();
    fetchTeams();
  }

  void fetchLiveMatch() {
    liveMatch.value = {
      'team1': 'APF FC',
      'team2': 'church boys',
      'team1_logo': 'https://i.imgur.com/VdSqdul.jpeg',
      'team2_logo': 'https://i.imgur.com/YsFYF0I.jpeg',
      'time': 'Live - 35:45',
      'venue': 'Old Trafford'
    };
  }

  void fetchUpcomingMatches() {
    upcomingMatches.value = [
      {
        'team1': 'APF FC',
        'team2': 'NRT FC',
        'team1_logo': 'https://i.imgur.com/VdSqdul.jpeg',
        'team2_logo': 'https://i.imgur.com/XKbx7AC.jpeg',
        'time': '08:00 PM'
      },
      {
        'team1': 'church boys',
        'team2': 'Jawlakhel FC',
        'team1_logo': 'https://i.imgur.com/YsFYF0I.jpeg',
        'team2_logo': 'https://i.imgur.com/1HLg1vT.jpeg',
        'time': '09:00 PM'
      }
    ];
  }

  void fetchTeams() {
    teams.value = [
      {'name': 'APF FC', 'logo': 'https://i.imgur.com/VdSqdul.jpeg'},
      {'name': 'NRT FC', 'logo': 'https://i.imgur.com/XKbx7AC.jpeg'},
      {'name': 'Church Boys', 'logo': 'https://i.imgur.com/YsFYF0I.jpeg'},
      {'name': 'Himalayan Sherpa', 'logo': 'https://i.imgur.com/xZPjng5.jpeg'},
      {
        'name': 'Jawlakhel Youth Club',
        'logo': 'https://i.imgur.com/1HLg1vT.jpeg'
      },
      {'name': 'Machhindra FC', 'logo': 'https://i.imgur.com/jJdympY.jpeg'},
      {'name': 'Nepali sena', 'logo': 'https://i.imgur.com/laWYm0I.jpeg'},
    ];
  }
}
