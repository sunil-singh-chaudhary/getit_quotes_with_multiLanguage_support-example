import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:getit_quotes_example/quotes/domain/quotemodel.dart';
import 'package:getit_quotes_example/quotes/repository/quoterepo.dart';

class QuoteScreen extends StatefulWidget {
  const QuoteScreen({super.key});

  @override
  State<QuoteScreen> createState() => QuoteScreenState();
}

class QuoteScreenState extends State<QuoteScreen> {
  List<Quote> QuoteList = [];
  final _quoteRepository = GetIt.I<QuoteRepository>();

  @override
  void initState() {
    getQotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('QUOTES LIST'),
      ),
      body: ListView.builder(
        itemCount: QuoteList.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(child: Text('$index')),
            title: Text(QuoteList[index].quote),
          );
        },
      ),
    );
  }

  void getQotes() async {
    List<Quote> list =
        await _quoteRepository.getQuote('https://dummyjson.com/quotes');

    debugPrint("List of Quotes- $list");
    setState(() {
      QuoteList = list;
    });
  }
}
