import 'package:flutter/material.dart';
import 'package:form_approval_app/widgets/app_drawer.dart';

class ApprovalSection extends StatelessWidget {
  const ApprovalSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Approval Form')),
      drawer: const AppDrawer(),
      body: const Center(child: Text('Halaman Approval Section')),
    );
  }
}
