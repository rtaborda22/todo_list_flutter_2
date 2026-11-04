import 'package:shared_preferences/shared_preferences.dart';
import '../models/app_settings.dart'; // <-- 1. CORRIGIDO CAMINHO DO IMPORT (FALTAVA UMA BARRA)

class AppStorage {
  static const String loggedInKey = 'isLoggedIn';
  static const String usernameKey = 'username';
  static const String passwordKey = 'password';
  static const String darkModeKey = 'darkMode';
  static const String confirmDeleteKey = 'cofirmDelete';

  static const String defaultUserName = 'aluno';
  static const String defaultPassword = '1234';

  Future<void> ensureDefaultUser() async {
    final prefs = await SharedPreferences.getInstance();

    if (!prefs.containsKey(usernameKey)) { // <-- 2. REMOVIDO UNDERLINE ACCIDENTAL
      await prefs.setString(usernameKey, defaultUserName); // <-- 3. REMOVIDO UNDERLINE ACCIDENTAL
    }

    if (!prefs.containsKey(passwordKey)) { // <-- 4. REMOVIDO UNDERLINE ACCIDENTAL
      await prefs.setString(passwordKey, defaultPassword); // <-- 5. REMOVIDO UNDERLINE ACCIDENTAL
    }
  }

  Future<bool> loadIsLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(loggedInKey) ?? false; // <-- 6. REMOVIDO UNDERLINE ACCIDENTAL
  }

  Future<void> setLoggedIn(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(loggedInKey, value); // <-- 7. REMOVIDO UNDERLINE ACCIDENTAL
  }

  Future<bool> validateLogin(String username, String password) async {
    await ensureDefaultUser();
    final prefs = await SharedPreferences.getInstance();

    final savedUsername = prefs.getString(usernameKey) ?? defaultUserName; // <-- CORRIGIDO UNDERLINE
    final savedPassword = prefs.getString(passwordKey) ?? defaultPassword; // <-- CORRIGIDO UNDERLINE

    return username == savedUsername && password == savedPassword;
  }

  Future<String> loadPassword() async {
    await ensureDefaultUser();
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(passwordKey) ?? defaultPassword; // <-- CORRIGIDO UNDERLINE
  }

  Future<void> savedPassword(String password) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(passwordKey, password); // <-- CORRIGIDO UNDERLINE
  }

  Future<AppSettings> loadSettings() async {
    final prefs = await SharedPreferences.getInstance();

    return AppSettings(
      darkMode: prefs.getBool(darkModeKey) ?? false, // <-- 8. CORRIGIDO DE _darkMod PARA darkModeKey
      confirmDelete: prefs.getBool(confirmDeleteKey) ?? true,
    );
  }

  Future<void> saveDarkMode(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(darkModeKey, value); // <-- CORRIGIDO PARA darkModeKey (LETRA K MINÚSCULA E SEM UNDERLINE)
  }

  Future<void> saveConfirmDelete(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(confirmDeleteKey, value); // <-- CORRIGIDO PARA confirmDeleteKey (LETRA K MINÚSCULA E SEM UNDERLINE)
  }
}
