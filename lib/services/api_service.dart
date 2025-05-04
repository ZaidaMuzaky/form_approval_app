import 'dart:convert';
import 'package:http/http.dart' as http;
import 'auth_service.dart';

class ApiService {
  static const String baseUrl = 'http://192.168.10.112:8000/api';

  static Future<Map<String, dynamic>> login(
    String username,
    String password,
  ) async {
    final url = Uri.parse('$baseUrl/login');

    try {
      final response = await http.post(
        url,
        headers: {'Accept': 'application/json'},
        body: {'username': username, 'password': password},
      );

      final data = jsonDecode(response.body);
      if (response.statusCode == 200 && data['token'] != null) {
        // Simpan username dan tipe pengguna ke AuthService
        AuthService.loginAs(
          data['user']['role'] == 'admin'
              ? UserType.admin
              : UserType.user, // Atur tipe pengguna
          username: data['user']['username'], // Ambil username dari respons
        );
        return {'success': true, 'token': data['token'], 'user': data['user']};
      } else {
        return {'success': false, 'message': data['message'] ?? 'Login gagal'};
      }
    } catch (e) {
      return {'success': false, 'message': 'Gagal koneksi ke server: $e'};
    }
  }
}
