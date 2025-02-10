import 'package:get/get.dart';
import 'package:gold_cup/app/views/calendar_view.dart';
import 'package:gold_cup/app/views/news_view.dart';
import '../views/home_view.dart';
import '../views/live_stream_view.dart';

class AppPages {
  static final initial = '/home';

  static final routes = [
    GetPage(name: '/home', page: () => HomeView()),
    GetPage(name: '/news', page: () =>  NewsView()),
    GetPage(name: '/calendar', page: () =>  CalendarView()),
    GetPage(name: '/live', page: () => LiveStreamView()),
  ];
}
