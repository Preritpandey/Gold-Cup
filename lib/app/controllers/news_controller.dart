import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class News {
  final String id;
  final String title;
  final String image;
  final String description;
  final DateTime createdAt;

  News({
    required this.id,
    required this.title,
    required this.image,
    required this.description,
    required this.createdAt,
  });

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      id: json['_id'],
      title: json['title'],
      image: json['image'],
      description: json['description'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }
}

class NewsController extends GetxController {
  var newsList = <News>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    fetchNews();
    super.onInit();
  }

  Future<void> fetchNews() async {
    try {
      isLoading(true);

      final response = await http.get(Uri.parse(
        // 'http://192.168.1.70:9991/api/news',
        'http://10.22.27.191:9991/api/news',
      ));

      print("Response Code: ${response.statusCode}");
      print("Response Body: ${response.body}");

      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);

        // Ensure it's a list before mapping
        if (jsonData is List) {
          newsList.value = jsonData.map((item) => News.fromJson(item)).toList();
        } else {
          print("Unexpected JSON structure: $jsonData");
          Get.snackbar("Error", "Invalid data format");
        }
      } else {
        Get.snackbar("Error", "Failed to load news");
      }
    } catch (e) {
      print("Error: $e");
      Get.snackbar("Error", "Something went wrong");
    } finally {
      isLoading(false);
    }
  }
}
