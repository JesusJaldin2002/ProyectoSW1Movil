import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proyecto_sw1_movil/src/models/user.dart';
import 'package:proyecto_sw1_movil/src/providers/users_provider.dart';

class RegisterController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  UsersProvider usersProvider = UsersProvider();

  void register() async {
    String name = nameController.text.trim();
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String confirmPassword = confirmPasswordController.text.trim();

    if (isValidForm(name, email, password, confirmPassword)) {
      User user = User(
        name: name,
        email: email,
        password: password,
        confirmPassword: confirmPassword,
      );

      Response response = await usersProvider.register(user);

      if (response.statusCode == 200) {
        Get.snackbar('Registro exitoso', 'Por favor, inicia sesión',
            backgroundColor: const Color.fromARGB(255, 0, 56, 2),
            colorText: const Color.fromARGB(255, 255, 255, 255),
            duration: const Duration(seconds: 3));

        Get.offAllNamed('/login');
      } else {
        Get.snackbar('Error de registro', 'Por favor, intenta de nuevo',
            backgroundColor: const Color.fromARGB(255, 233, 93, 0),
            colorText: const Color.fromARGB(255, 255, 255, 255));
      }
    }
  }

  bool isValidForm(String name, String email, String password, String confirmPassword) {
    if (name.isEmpty) {
      Get.snackbar('Formulario no válido', 'Por favor ingrese el nombre',
          backgroundColor: const Color.fromARGB(255, 233, 93, 0),
          colorText: Colors.white);
      return false;
    }

    if (!GetUtils.isEmail(email)) {
      Get.snackbar('Email no válido', 'Por favor ingrese un email válido',
          backgroundColor: const Color.fromARGB(255, 233, 93, 0),
          colorText: Colors.white);
      return false;
    }

    if (password.isEmpty || confirmPassword.isEmpty) {
      Get.snackbar('Formulario no válido', 'Por favor ingrese la contraseña',
          backgroundColor: const Color.fromARGB(255, 233, 93, 0),
          colorText: Colors.white);
      return false;
    }

    if (password.length < 8) {
      Get.snackbar('Formulario no válido', 'La contraseña debe tener al menos 8 dígitos',
          backgroundColor: const Color.fromARGB(255, 233, 93, 0),
          colorText: Colors.white);
      return false;
    }

    if (password != confirmPassword) {
      Get.snackbar('Formulario no válido', 'Las contraseñas no coinciden',
          backgroundColor: const Color.fromARGB(255, 233, 93, 0),
          colorText: Colors.white);
      return false;
    }

    return true;
  }
}
