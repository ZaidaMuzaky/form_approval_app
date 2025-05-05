import 'package:flutter/material.dart';
import 'package:form_approval_app/widgets/app_drawer.dart';

class ImageEditorPage extends StatelessWidget {
  const ImageEditorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Gambar Soal')),
      drawer: const AppDrawer(),
      body: const Center(child: Text('Halaman Edit Gambar')),
    );
  }
}
