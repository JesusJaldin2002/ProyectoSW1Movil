import 'package:flutter/material.dart';
import 'package:proyecto_sw1_movil/src/shared/shared.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Bienvenido a la APP',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF004D40),
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFb2dfdb), Color(0xFF80cbc4)], // Fondo más verde
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          // Añadir formas adicionales
          Positioned(
            top: 50,
            left: 20,
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.3),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            top: 150,
            right: 30,
            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.3),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            bottom: 100,
            left: 40,
            child: Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.3),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          Positioned(
            bottom: 200,
            right: 50,
            child: Transform.rotate(
              angle: -0.3,
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          Positioned(
            top: 300,
            left: 80,
            child: Transform.rotate(
              angle: 0.3,
              child: Container(
                width: 140,
                height: 140,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.3), // Añade una capa de color para mayor contraste
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    radius: 60, // Ajustando el tamaño del logo
                    backgroundImage: AssetImage('assets/images/logo-white2.png'),
                    backgroundColor: Color(0xFF004D40), // Fondo del logo para combinar mejor
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Bienvenido a nuestra Aplicación',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Esta aplicación te permitirá aprender y traducir lenguaje de señas. Podrás explorar diferentes categorías y practicar gestos a través de videos interactivos. Además, podrás usar la sección de traducción en tiempo real para comunicarte mejor con personas que utilizan el lenguaje de señas.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 40),
                  Builder(
                    builder: (context) => ElevatedButton(
                      onPressed: () {
                        Scaffold.of(context).openDrawer(); // Abre el drawer
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF004D40), // Botón del mismo color que el AppBar
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Text(
                        'Empezar',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      drawer: Sidebar(),
    );
  }
}
