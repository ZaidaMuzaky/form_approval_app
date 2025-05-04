enum UserType { admin, user }

class AuthService {
  static String currentUsername = '';
  static UserType userType = UserType.user;

  static void loginAs(UserType type, {String username = ''}) {
    userType = type;
    currentUsername = username; // Simpan username saat login
  }
}
