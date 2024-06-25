import 'package:get/get.dart';
import 'package:proyecto_sw1_movil/src/config/environment/environment.dart';
import 'package:proyecto_sw1_movil/src/models/category_word.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LearningProvider extends GetConnect {
  String url = Environment.apiUrl;

  Future<CategoryWord> getLearningCategories() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    if (token == null) {
      throw Exception('Token not found');
    }

    final response = await get(
      '$url/api/learning',
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    if (response.status.hasError) {
      throw Exception('Error fetching categories: ${response.statusText}');
    }

    return CategoryWord.fromJson(response.body);
  }
}
