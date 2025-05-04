import 'package:flutter/material.dart';

class ApprovalSection extends StatelessWidget {
  const ApprovalSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Approval Form')),
      body: const Center(child: Text('Halaman Approval Section')),
    );
  }
}
