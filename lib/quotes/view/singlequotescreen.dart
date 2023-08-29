import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:getit_quotes_example/quotes/domain/quotemodel.dart';
import 'package:getit_quotes_example/quotes/repository/singlequoterepo.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../language/language_selection_dialog.dart';

class SingleQuoteScreen extends StatefulWidget {
  const SingleQuoteScreen({super.key});

  @override
  State<SingleQuoteScreen> createState() => _SingleQuoteScreenState();
}

class _SingleQuoteScreenState extends State<SingleQuoteScreen> {
  final singlerepo = GetIt.I<SingleQuoteRepository>();
  Quote quoteMsg = Quote(id: 1, quote: '', author: '');
  int id = 1;
  @override
  void initState() {
    super.initState();
    getSingleQuote(id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(children: [
        Center(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              quoteMsg.quote,
              style: const TextStyle(color: Colors.green, fontSize: 22),
            ),
          ),
        ),
        Container(
          alignment: Alignment.centerRight,
          child: InkWell(
            onTap: () {
              int nid = id + 1;
              getSingleQuote(nid);
            },
            child: const Icon(
              Icons.forward,
              color: Colors.black,
              size: 54,
            ),
          ),
        ),
        Container(
            alignment: Alignment.bottomCenter,
            child: ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => const LanguageSelectionDialog(),
                );
              },
              child: Text(AppLocalizations.of(context)!.language),
            ))
      ]),
    );
  }

  void getSingleQuote(int fid) async {
    final msg = await singlerepo.getQuote('https://dummyjson.com/quotes/$id');
    debugPrint('msg is ${msg?.quote}');
    setState(() {
      id = fid;
      quoteMsg = msg!;
    });
  }
}
