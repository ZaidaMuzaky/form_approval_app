import 'package:flutter/material.dart';
import 'package:form_approval_app/widgets/app_drawer.dart';

class FormPage extends StatelessWidget {
  const FormPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Isi Form')),
      drawer: const AppDrawer(),
      body: const Center(child: Text('Halaman Form')),
    );
  }
}
