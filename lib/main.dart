import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'splash_screen.dart'; // صفحة البداية
import 'login_screen.dart';
import 'register_screen.dart';
import 'firebase_options.dart'; // استدعاء إعدادات Firebase

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform, // تهيئة Firebase
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(), // تحديد صفحة البداية كـ SplashScreen
      routes: {
        '/login': (context) => const LoginScreen(), // صفحة تسجيل الدخول
        '/register': (context) => const RegisterScreen(), // صفحة التسجيل
      },
    );
  }
}
