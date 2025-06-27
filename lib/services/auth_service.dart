//'package:alexfitnes/services/auth_service.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  static const _roleKey = 'user_role';

  Future<String?> login(String login, String password) async {
    try {
      // Здесь запрос к API
      final response = await http.post(
        Uri.parse('http://localhost:8080'),
        // сервер на моём ПК
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'login': login, 'password': password}),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data['success']) {
          final role = data['role'] as String;
          // Сохраняем роль в SharedPreferences
          final prefs = await SharedPreferences.getInstance();
          await prefs.setString(_roleKey, role);
          return role;
        }
      }
      return null;
    } catch (e) {
      print('Ошибка авторизации: $e');
      return null;
    }
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_roleKey);
  }

  Future<String?> getCurrentRole() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_roleKey);
  }
}
