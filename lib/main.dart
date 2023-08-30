import 'package:flutter/material.dart';
import 'package:getit_quotes_example/locator.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'homepage.dart';
import 'language/languageconstant.dart';

void main() {
  setUpLocator();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();

  //set local language
  static void setLocale(BuildContext context, Locale newLocale) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    //callinng back from child to parent need this

    state?.setLocales(newLocale);
    //then its state object we can set or call method in this class
  }
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;

  setLocales(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void didChangeDependencies() {
    getLocale().then((locale) => {
          setLocales(locale),
        });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // locale: Provider.of<LanguageProvider>(context).selectedLocale,
      locale: _locale,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales, //add all

      home: const HomePage(),
    );
  }
}
