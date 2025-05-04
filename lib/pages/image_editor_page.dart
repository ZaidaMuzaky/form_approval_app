import 'package:flutter/material.dart';

class ImageEditorPage extends StatelessWidget {
  const ImageEditorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Gambar Soal')),
      body: const Center(child: Text('Halaman Edit Gambar')),
    );
  }
}
