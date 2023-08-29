# getit_quotes_example with Localization in flutter


# FOr Localization
 1. add dependecies in yml file 
       flutter_localization: ^0.1.13
       intl: ^0.18.1  
 2. add this dependencies too
       flutter:
     generate: true
     uses-material-design: true

  3. Create in root of your project a l10n.yaml file
  4. Create a l10n direactory inside lib folder
     and create two files here
     1. app_en.arb
     2. l10n.dart

  5. inside l10n.yaml custom file add these below path lines
     arb-dir : lib/l10n    //source
     template-arb-file: app_en.arb    //to convert
     output-localization-file: app_localizations.dart    //out output generate file will be here 

  6. at last add this below lines in materialApp of main.dartfile 
           locale: const Locale('en'), //default en
      supportedLocales: L10n.all, //add all
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
   
   7. import this
      import 'package:flutter_gen/gen_l10n/app_localizations.dart';

   8. HOw to use
      AppLocalizations.of(context)!.language
   
   9. important for changing language support from app we are using provider with sharedpreference
      becuase of   AppLocalizations.delegate.load(newLocale); is not working when we set new lanugage and restarted the application i.e
