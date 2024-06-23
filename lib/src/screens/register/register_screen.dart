import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proyecto_sw1_movil/src/screens/register/register_controller.dart';

class RegisterScreen extends StatelessWidget {

  final RegisterController controller  = Get.put(RegisterController());

  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF004D40),
          title: const Text(
            'Register',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        body: Stack(
          children: [
            _backgroundCover(context),
            _imageUser(),
            _boxForm(context),
          ],
        ),
      ),
    );
  }

  Widget _backgroundCover(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.32,
      color: const Color(0xFF004D40),
    );
  }

  Widget _boxForm(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Container(
        margin: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.09,
            left: 35,
            right: 35),
        height: MediaQuery.of(context).size.height * 0.77,
        decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.black54,
                  blurRadius: 15,
                  offset: Offset(0, 0.75))
            ],
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _textYourInfo(),
              _textFieldName(),
              _textFieldEmail(),
              _textFieldPassword(),
              _textFieldConfirmPassword(),
              const SizedBox(height: 5),
              _buttonRegister()
            ],
          ),
        ),
      ),
    );
  }

  Widget _buttonRegister() {
    return Container(
      margin: const EdgeInsets.only(top: 30, left: 30, right: 30),
      child: ElevatedButton(
        onPressed: () {
          controller.register();
        },
        style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF00695C),
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
        child: const Text(
          'Registrarse',
          style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: Color(0xFFFFFFFF)),
        ),
      ),
    );
  }

  Widget _textFieldName() {
    return Container(
      margin: const EdgeInsets.only(top: 5, left: 30, right: 30),
      child: TextField(
        controller: controller.nameController,
        keyboardType: TextInputType.text,
        decoration: const InputDecoration(
          hintText: 'Nombre',
          icon: Icon(Icons.person),
          labelText: 'Nombre',
          labelStyle: TextStyle(color: Color(0xFF000000)),
          hintStyle: TextStyle(color: Color(0xFF000000)),
          border: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF000000))),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF000000))),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF000000))),
        ),
      ),
    );
  }

  Widget _textFieldEmail() {
    return Container(
      margin: const EdgeInsets.only(top: 5, left: 30, right: 30),
      child: TextField(
        controller: controller.emailController,
        keyboardType: TextInputType.emailAddress,
        decoration: const InputDecoration(
          hintText: 'Correo electrónico',
          icon: Icon(Icons.email),
          labelText: 'Correo electrónico',
          labelStyle: TextStyle(color: Color(0xFF000000)),
          hintStyle: TextStyle(color: Color(0xFF000000)),
          border: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF000000))),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF000000))),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF000000))),
        ),
      ),
    );
  }

  Widget _textFieldPassword() {
    return Container(
      margin: const EdgeInsets.only(top: 5, left: 30, right: 30),
      child: TextField(
        controller: controller.passwordController,
        obscureText: true,
        keyboardType: TextInputType.text,
        decoration: const InputDecoration(
          hintText: 'Contraseña',
          icon: Icon(Icons.lock),
          labelText: 'Contraseña',
          labelStyle: TextStyle(color: Color(0xFF000000)),
          hintStyle: TextStyle(color: Color(0xFF000000)),
          border: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF000000))),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF000000))),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF000000))),
        ),
      ),
    );
  }

  Widget _textFieldConfirmPassword() {
    return Container(
      margin: const EdgeInsets.only(top: 5, left: 30, right: 30),
      child: TextField(
        controller: controller.confirmPasswordController,
        obscureText: true,
        keyboardType: TextInputType.text,
        decoration: const InputDecoration(
          hintText: 'Confirmar contraseña',
          icon: Icon(Icons.lock_outline),
          labelText: 'Confirmar contraseña',
          labelStyle: TextStyle(color: Color(0xFF000000)),
          hintStyle: TextStyle(color: Color(0xFF000000)),
          border: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF000000))),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF000000))),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF000000))),
        ),
      ),
    );
  }

  Widget _imageUser() {
    return SafeArea(
      child: Container(
        alignment: Alignment.topCenter,
        child: const CircleAvatar(
          radius: 80,
          backgroundImage: AssetImage('assets/images/user_profile.png'),
          backgroundColor: Colors.white,
        ),
      ),
    );
  }

  Widget _textYourInfo() {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: const Text(
        'Ingresa tus datos',
        style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFF000000)),
      ),
    );
  }
}
