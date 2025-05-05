import 'package:flutter/material.dart';
import 'package:form_approval_app/widgets/app_drawer.dart';

class StatusAllPage extends StatelessWidget {
  const StatusAllPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Status Semua Form')),
      drawer: const AppDrawer(),
      body: const Center(child: Text('Semua status form akan tampil di sini')),
    );
  }
}
