import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proyecto_sw1_movil/src/providers/users_provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class Sidebar extends StatelessWidget {
  Sidebar({Key? key}) : super(key: key);
  final UsersProvider usersProvider = UsersProvider();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: usersProvider.getUserName(),
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Drawer(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (snapshot.hasData) {
          return Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 19, 53, 47),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CircleAvatar(
                        radius: 30.0,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.person,
                          size: 30.0,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          snapshot.data!,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
                ListTile(
                  leading: const Icon(FontAwesomeIcons.house, color: Color(0xFF004D40)),
                  title: const Text('Inicio'),
                  onTap: () => _onItemTapped(0),
                ),
                ListTile(
                  leading: const Icon(FontAwesomeIcons.language, color: Color(0xFF004D40)),
                  title: const Text('Traducción'),
                  onTap: () => _onItemTapped(1),
                ),
                ListTile(
                  leading: const Icon(FontAwesomeIcons.book, color: Color(0xFF004D40)),
                  title: const Text('Aprendizaje'),
                  onTap: () => _onItemTapped(3),
                ),
                ListTile(
                  leading: const Icon(FontAwesomeIcons.arrowRightFromBracket, color: Color(0xFF004D40)),
                  title: const Text(
                    'Cerrar Sesión',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  onTap: () => _onItemTapped(2),
                ),
              ],
              
            ),
          );
        } else {
          return const Drawer();
        }
      },
    );
  }

  void _onItemTapped(int index) {
    switch (index) {
      case 0:
        Get.offAllNamed('/home');
        break;
      case 1:
        Get.toNamed('/webview');
        break;
      case 2:
        usersProvider.logout();
        break;
      case 3:
        Get.toNamed('/learning');
        break;
    }
  }
}
