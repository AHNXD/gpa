import 'package:shared_preferences/shared_preferences.dart';
import '../constant.dart';

class SaveService {
  static Future<void> retrieveLang() async {
    final prefs = await SharedPreferences.getInstance();
    // Check where the Ip is saved before or not
    if (!prefs.containsKey('lang')) {
      return;
    }
    lang = prefs.getString('lang')!;
  }

  static Future<void> saveLang() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('lang', lang);
  }

  static Future<void> clearLang() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('lang', "none");
  }
}
