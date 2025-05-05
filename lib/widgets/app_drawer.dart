import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import '../pages/form_page.dart';
import '../pages/status_page.dart';
import '../pages/approval_section.dart';
import '../pages/image_editor_page.dart';
import 'package:form_approval_app/login_page.dart';
import 'package:form_approval_app/pages/status_all_page.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final isAdmin = AuthService.userType == UserType.admin;
    final username =
        AuthService.currentUsername; // Ambil username dari AuthService

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 48, 48, 48),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Tambahkan logo perusahaan
                Center(
                  child: Image.asset(
                    'assets/images/Logocompany.png', // Ganti dengan path logo Anda
                    height: 30,
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Menu',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
                const SizedBox(height: 8),
                Text(
                  'Hai $username', // Tampilkan username
                  style: const TextStyle(color: Colors.white70, fontSize: 16),
                ),
              ],
            ),
          ),
          if (isAdmin) ...[
            // Hanya tampilkan untuk Admin
            ListTile(
              leading: const Icon(Icons.check_circle_outline),
              title: const Text('Status Semua Form'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const StatusAllPage(),
                  ), // Pass parameter isAdmin
                );
              },
            ),
          ],
          if (!isAdmin) ...[
            ListTile(
              leading: const Icon(Icons.edit),
              title: const Text('Isi Form'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const FormPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.check_circle_outline),
              title: const Text('Status Form'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const StatusPage()),
                );
              },
            ),
          ],
          if (isAdmin) ...[
            ListTile(
              leading: const Icon(Icons.image),
              title: const Text('Ganti Gambar Soal'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const ImageEditorPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.approval),
              title: const Text('Form Approval'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const ApprovalSection()),
                );
              },
            ),
          ],
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () {
              _showLogoutConfirmation(
                context,
              ); // Panggil fungsi konfirmasi logout
            },
          ),
        ],
      ),
    );
  }

  void _showLogoutConfirmation(BuildContext parentContext) {
    showDialog(
      context: parentContext,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Konfirmasi Logout'),
          content: const Text('Apakah Anda yakin ingin logout?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Tutup dialog
              },
              child: const Text('Batal'),
            ),
            TextButton(
              onPressed: () async {
                await AuthService.logout(); // Hapus session/login data
                if (parentContext.mounted) {
                  Navigator.of(context).pop(); // Tutup dialog

                  // Navigasi ke LoginPage dan hapus semua halaman sebelumnya
                  Navigator.of(parentContext).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (_) => const LoginPage()),
                    (Route<dynamic> route) => false,
                  );
                }
              },
              child: const Text('Logout'),
            ),
          ],
        );
      },
    );
  }
}
