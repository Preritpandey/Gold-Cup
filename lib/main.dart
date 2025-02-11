import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gold_cup/app/routes/app_pages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // color: Color.fromARGB(255, 238, 230, 230),
      debugShowCheckedModeBanner: false,
      title: 'Football App',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
    );
  }
}
