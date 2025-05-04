import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import '../pages/home_page.dart';
import '../pages/form_page.dart';
import '../pages/status_page.dart';
import '../pages/approval_section.dart';
import '../pages/image_editor_page.dart';

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
            decoration: const BoxDecoration(color: Colors.indigo),
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
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Beranda'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const HomePage()),
              );
            },
          ),
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

  void _showLogoutConfirmation(BuildContext context) {
    showDialog(
      context: context,
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
              onPressed: () {
                Navigator.of(context).pop(); // Tutup dialog
                AuthService.loginAs(UserType.user); // Reset user login
                Navigator.pushReplacementNamed(
                  context,
                  '/login',
                ); // Navigasi ke halaman login
              },
              child: const Text('Logout'),
            ),
          ],
        );
      },
    );
  }
}
