import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proyecto_sw1_movil/src/providers/users_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  UsersProvider usersProvider = UsersProvider();

  Future<void> login() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if (isValidForm(email, password)) {
      Response response = await usersProvider.login(email, password);

      if (response.statusCode == 200) {
        // Verificar si response.body es una cadena JSON y decodificarla
        Map<String, dynamic> responseBody;
        if (response.body is String) {
          responseBody = jsonDecode(response.body) as Map<String, dynamic>;
        } else {
          responseBody = response.body as Map<String, dynamic>;
        }

        // Verificar si la respuesta contiene un error
        if (responseBody.containsKey('error')) {
          Get.snackbar('Error de Login', responseBody['error'],
              backgroundColor: const Color.fromARGB(255, 233, 93, 0),
              colorText: Colors.white);
        } else {
          // Guarda el token en el almacenamiento local para usarlo en futuras solicitudes
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString('token', responseBody['token']);
          await prefs.setString('user_id', responseBody['id'].toString());
          await prefs.setString('user_name', responseBody['name']);

          String? savedToken = prefs.getString('token');
          // ignore: avoid_print
          print('Token guardado: $savedToken');
          Get.toNamed('/home');
        }
      } else {
        Get.snackbar('Error de Login', 'Por favor vuelve a intentarlo',
            backgroundColor: const Color.fromARGB(255, 233, 93, 0),
            colorText: Colors.white);
      }
    }
  }

  void goToRegisterPage() {
    Get.toNamed('/register');
  }

  bool isValidForm(String email, String password) {
    if (!GetUtils.isEmail(email)) {
      Get.snackbar('Email no válido', 'Por favor ingrese un email válido',
          backgroundColor: const Color.fromARGB(255, 233, 93, 0),
          colorText: Colors.white);
      return false;
    }

    if (password.isEmpty) {
      Get.snackbar('Formulario no válido', 'Por favor ingrese todos los campos',
          backgroundColor: const Color.fromARGB(255, 233, 93, 0),
          colorText: Colors.white);
      return false;
    }

    return true;
  }
}
