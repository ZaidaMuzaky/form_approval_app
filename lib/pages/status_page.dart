import 'package:flutter/material.dart';
import 'package:form_approval_app/widgets/app_drawer.dart';

class StatusPage extends StatelessWidget {
  const StatusPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Status Form')),
      drawer: const AppDrawer(),
      body: const Center(child: Text('Status form Anda akan tampil di sini')),
    );
  }
}
