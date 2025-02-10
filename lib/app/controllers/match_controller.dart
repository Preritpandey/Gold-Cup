import 'package:get/get.dart';

class MatchController extends GetxController {
  var matchStats = {
    'shots': [18, 9],
    'onGoal': [9, 4],
    'possession': [67, 33]
  }.obs;
}
