import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:getit_quotes_example/l10n/l10n.dart';

import 'package:getit_quotes_example/locator.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import 'homepage.dart';
import 'language/language_provider.dart';

void main() {
  setUpLocator();
  runApp(
    ChangeNotifierProvider(
      create: (_) => LanguageProvider()..loadLanguage(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      locale: Provider.of<LanguageProvider>(context).selectedLocale,
      // Use the selected locale or default to 'en'
      supportedLocales: L10n.all, //add all

      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      home: const HomePage(),
    );
  }
}
