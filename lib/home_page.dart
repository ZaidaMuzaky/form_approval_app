import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  // Meneruskan parameter key ke constructor superclass StatelessWidget
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home")),
      body: Center(child: Text("Berhasil login!")),
    );
  }
}
