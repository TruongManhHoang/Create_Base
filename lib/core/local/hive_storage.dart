import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class GlobalStorageKey {
  const GlobalStorageKey._();

  static const globalStorage = 'globalStorage';
  static const userId = 'user_id';
  static const accessToken = 'access_token';
  static const isLoggedIn = 'is_logged_in';
  static const isDarkMode = 'isDarkMode';
  static const languageCode = 'languageCode';
  static const role = 'role';
  static const userData = 'userData';
}

abstract class GlobalStorage {
  Future<void> init();

  // New authentication methods
  String? get accessToken;

  String? get userId;

  String? get role;

  bool get isLoggedIn;

  Locale get languageCode;

  set languageCode(Locale languageCode);

  bool get darkMode;

  set darkMode(bool isDarkMode);

  Future<void> updateAuthenticationState({
    required String? token,
    required String? userId,
    required String? role,
  });

  Future<void> clearAuthenticationState();

  Map<String, dynamic> get userData;

  set userData(dynamic data);
}

class GlobalStorageImpl implements GlobalStorage {
  late Box _box;

  @override
  Locale get languageCode {
    String lang = _box.get(GlobalStorageKey.languageCode, defaultValue: 'en');
    return Locale(lang);
  }

  @override
  set languageCode(Locale languageCode) {
    _box.put(GlobalStorageKey.languageCode, languageCode.languageCode);
  }

  @override
  Future<void> init() async {
    _box = await Hive.openBox('globalStorage');
  }

  @override
  String? get accessToken {
    return _box.get(GlobalStorageKey.accessToken);
  }

  @override
  String? get role {
    return _box.get(GlobalStorageKey.role);
  }

  @override
  String? get userId {
    return _box.get(GlobalStorageKey.userId);
  }

  @override
  bool get isLoggedIn {
    return _box.get(GlobalStorageKey.isLoggedIn, defaultValue: false);
  }

  @override
  bool get darkMode {
    return _box.get(GlobalStorageKey.isDarkMode, defaultValue: false);
  }

  @override
  set darkMode(bool isDarkMode) {
    _box.put(GlobalStorageKey.isDarkMode, isDarkMode);
  }

  @override
  Future<void> updateAuthenticationState({
    required String? token,
    required String? userId,
    required String? role,
  }) async {
    if (token == null || userId == null) {
      await clearAuthenticationState();
      return;
    }
    await Future.wait([
      _box.put(GlobalStorageKey.accessToken, token),
      _box.put(GlobalStorageKey.userId, userId),
      _box.put(GlobalStorageKey.isLoggedIn, true),
      _box.put(GlobalStorageKey.role, role)
    ]);
  }

  @override
  Future<void> clearAuthenticationState() async {
    await Future.wait([
      _box.delete(GlobalStorageKey.accessToken),
      _box.delete(GlobalStorageKey.userId),
      _box.delete(GlobalStorageKey.isLoggedIn),
      _box.delete(GlobalStorageKey.role),
      _box.delete(GlobalStorageKey.userData)
    ]);

    debugPrint(
        "Cleared authentication state: ${_box.get(GlobalStorageKey.isLoggedIn)} ${_box.get(GlobalStorageKey.accessToken)} ${_box.get(GlobalStorageKey.userId)} ${_box.get(GlobalStorageKey.role)}");
  }

  @override
  Map<String, dynamic> get userData {
    return _box.get(GlobalStorageKey.userData) ??
        {
          'accessToken': '',
          'refreshToken': '',
          'user': null,
        };
  }

  @override
  set userData(dynamic data) {
    _box.put(GlobalStorageKey.userData, data);
  }
}
