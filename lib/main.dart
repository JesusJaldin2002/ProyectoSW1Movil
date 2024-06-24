import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proyecto_sw1_movil/src/config/environment/environment.dart';
import 'package:proyecto_sw1_movil/src/config/theme/app_theme.dart';
import 'package:proyecto_sw1_movil/src/screens/screens.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  await Environment.initEnvironment();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'College',
      debugShowCheckedModeBanner: false,
      theme: AppTheme().getTheme(),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => LoginScreen()),
        GetPage(name: '/home', page: () => const HomeScreen(), middlewares: [AuthMiddleware()]),
        GetPage(name: '/register', page: () => RegisterScreen(), middlewares: [AuthMiddleware()]),
        GetPage(name: '/webview', page: () => const WebViewScreen(), middlewares: [AuthMiddleware()]),

        
      ],
      navigatorKey: Get.key,
    );
  }
}

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    SharedPreferences.getInstance().then((prefs) {
      bool isAuthenticated = prefs.getBool('isAuthenticated') ?? false;
      if (!isAuthenticated) {
        // ignore: avoid_print
        print('Not authenticated, redirecting to /');
        return const RouteSettings(name: '/');
      }
    });
    return null;
  }
}