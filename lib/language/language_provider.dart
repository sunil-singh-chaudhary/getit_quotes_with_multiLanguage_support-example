import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageProvider extends ChangeNotifier {
  Locale _selectedLocale = const Locale('en');
  Locale get selectedLocale => _selectedLocale;

  Future<void> setLanguage(Locale locale) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('selected_locale', locale.languageCode);
    _selectedLocale = locale;
    notifyListeners();
  }

  Future<void> loadLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    final languageCode = prefs.getString('selected_locale');
    if (languageCode != null) {
      _selectedLocale = Locale(languageCode);
    }
    notifyListeners();
  }
}
