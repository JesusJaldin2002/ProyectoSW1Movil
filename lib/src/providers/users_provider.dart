import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_sw1_movil/src/config/environment/environment.dart';
import 'package:proyecto_sw1_movil/src/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UsersProvider extends GetConnect {
  String url = Environment.apiUrl;

  Future<Response> register(User user) async {
    Response response = await post('$url/register', user.toJson(),
        headers: {'Content-Type': 'application/json'});

    return response;
  }

  Future<Response> login(String email, String password) async {
    Response response = await post(
        '$url/login', {'email': email, 'password': password},
        headers: {'Content-Type': 'application/json'});

    return response;
  }

  Future<String> getUserName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userName = prefs.getString('user_name');

    if (userName != null) {
      return userName;
    }

    return 'Usuario desconocido';
  }

  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? token = prefs.getString('token');

    if (token != null) {
      // Llama a la API para cerrar la sesión
      await post(
        '$url/logout',
        {},
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );

      await prefs.remove('token');

      Get.snackbar('Sesión cerrada', 'Has cerrado sesión exitosamente',
          backgroundColor: const Color.fromARGB(255, 0, 56, 2),
          colorText: const Color.fromARGB(255, 255, 255, 255),
          duration: const Duration(seconds: 1));

      Get.offNamed('/login');
    }
  }
}