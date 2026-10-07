import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsService {
  SharedPrefsService._internal();

  static final SharedPrefsService _instance = SharedPrefsService._internal();

  factory SharedPrefsService() => _instance;

  SharedPreferences? _prefs;

  Future<SharedPreferences> get _instancePrefs async {
    _prefs ??= await SharedPreferences.getInstance();
    return _prefs!;
  }

  Future<bool> setString(String key, String value) async {
    final prefs = await _instancePrefs;
    return prefs.setString(key, value);
  }

  Future<String?> getString(String key) async {
    final prefs = await _instancePrefs;
    return prefs.getString(key);
  }
}
