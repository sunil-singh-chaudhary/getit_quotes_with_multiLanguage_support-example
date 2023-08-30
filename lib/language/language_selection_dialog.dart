// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import '../main.dart';
import 'languageconstant.dart';

class LanguageSelectionDialog extends StatelessWidget {
  const LanguageSelectionDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(translation(context).language), //get language text
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          LanguageButton(context, 'English', const Locale('en')),
          LanguageButton(context, 'french', const Locale('fr')),
          LanguageButton(context, 'paston', const Locale('fa')),
          LanguageButton(context, 'arabic', const Locale('ar')),
          // Add more language buttons as needed
        ],
      ),
    );
  }
}

class LanguageButton extends StatelessWidget {
  final BuildContext context;
  final String languageName;
  final Locale locale;

  const LanguageButton(this.context, this.languageName, this.locale,
      {super.key});

  void _changeLanguage() async {
    //todo set Language new selected Code
    Locale _locale = await setLocaleTopref(locale.languageCode);
    MyApp.setLocale(context, _locale);

    Navigator.pop(context); // Close the dialog
    restartApp(context);
  }

  void restartApp(BuildContext context) {
    final currentRoute = ModalRoute.of(context)?.settings.name;
    Navigator.of(context).pushNamedAndRemoveUntil(
      currentRoute ?? '/',
      (Route<dynamic> route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _changeLanguage,
      child: Text(languageName),
    );
  }
}
