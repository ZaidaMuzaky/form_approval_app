import 'package:flutter/material.dart';
import 'login_page.dart';
import 'page/home_page.dart';

void main() {
  runApp(
    const MyApp(),
  ); // Sekarang boleh pakai const karena MyApp punya const constructor
}

class MyApp extends StatelessWidget {
  // Ubah menjadi super parameter + const constructor
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Approval',
      initialRoute: '/',
      routes: {
        // Karena LoginPage & HomePage juga punya const ctor,
        // kita bisa gunakan const di sini
        '/': (context) => const LoginPage(),
        '/home': (context) => const HomePage(),
      },
    );
  }
}
