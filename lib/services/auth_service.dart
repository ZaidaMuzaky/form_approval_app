import 'package:shared_preferences/shared_preferences.dart';

enum UserType { admin, user }

class AuthService {
  static String currentUsername = '';
  static UserType userType = UserType.user; // Ganti ke enum UserType

  // Fungsi untuk login dan menyimpan data pengguna ke SharedPreferences
  static Future<void> loginAs(UserType type, {String username = ''}) async {
    userType = type;
    currentUsername = username;

    // Simpan ke SharedPreferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', username);
    await prefs.setString('userType', type.toString()); // Simpan sebagai string
  }

  // Fungsi untuk logout dan menghapus data login
  static Future<void> logout() async {
    // Menghapus data login dari SharedPreferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('username');
    await prefs.remove('userType');

    // Reset data login di dalam aplikasi
    currentUsername = '';
    userType = UserType.user; // Set default ke user
  }

  // Fungsi untuk memuat data pengguna dari SharedPreferences
  static Future<void> loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Memuat username dan userType
    currentUsername = prefs.getString('username') ?? '';
    String? userTypeString = prefs.getString('userType');

    // Jika ada userType, konversi string ke enum UserType
    if (userTypeString != null) {
      userType = UserType.values.firstWhere(
        (e) => e.toString() == userTypeString,
        orElse: () => UserType.user, // Default ke user jika tidak ditemukan
      );
    }
  }
}
