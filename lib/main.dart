import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/auth_provider.dart';
import 'services/auth_service.dart';
import 'login_page.dart';
import 'pages/status_all_page.dart';
import 'pages/form_page.dart';
import 'pages/status_page.dart';
import 'pages/image_editor_page.dart';
import 'pages/approval_section.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Muat data login (username, role, token) dari storage
  await AuthService.loadUserData();

  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => AuthProvider())],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Jika belum login → ke LoginPage
    if (AuthService.currentUsername.isEmpty) {
      return MaterialApp(
        title: 'Form Approval App',
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {'/': (_) => const LoginPage()},
      );
    }

    // Sudah login → pilih berdasarkan role
    final initial =
        AuthService.userType == UserType.admin ? '/statusAll' : '/status';

    return MaterialApp(
      title: 'Form Approval App',
      debugShowCheckedModeBanner: false,
      initialRoute: initial,
      routes: {
        '/': (_) => const LoginPage(),
        '/status': (_) => const StatusPage(),
        '/statusAll': (_) => const StatusAllPage(),
        '/form': (_) => const FormPage(),
        '/image-editor': (_) => const ImageEditorPage(),
        '/approval-section': (_) => const ApprovalSection(),
      },
    );
  }
}
