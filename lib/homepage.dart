import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'quotes/view/singlequotescreen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.language),
      ),
      // body: QuoteScreen(),   //show all quotes in a listview uncommnet it then
      body: const SingleQuoteScreen(),
      //show one quote at a time and click  next to show next quote
    );
  }
}
