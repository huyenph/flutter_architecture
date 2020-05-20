import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesManager {
  static const String TOKEN = "token";

  static SharedPreferences _prefs;

  Future<SharedPreferences> _getPrefs() async {
    if (_prefs == null) {
      _prefs = await SharedPreferences.getInstance();
    }
    return _prefs;
  }

  Future setToken(String token) async {
    SharedPreferences preferences = await _getPrefs();
    preferences.setString(TOKEN, token);
  }

  Future<String> get token async {
    SharedPreferences preferences = await _getPrefs();
    return preferences.getString(TOKEN);
  }

  Future logout() async {
    await setToken(null);
  }
}
