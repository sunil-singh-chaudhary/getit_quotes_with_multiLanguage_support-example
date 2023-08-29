import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:getit_quotes_example/quotes/domain/quotemodel.dart';

class SingleQuoteRepository {
  Dio dio = Dio();
  Quote? quoteList;
  Future<Quote?> getQuote(String quoteUrl) async {
    Response response = await dio.get(quoteUrl);

    final contentType = response.headers['content-type'];
    debugPrint('contentType---> $contentType');

    if (response.statusCode == 200) {
      Map<String, dynamic> quoteMap = response.data; // Already a map
      quoteList = Quote.fromJson(quoteMap);
      debugPrint('quoteList---> $quoteList');

      //body in http , data in dio
    } else {
      debugPrint('error response ${response.statusMessage}');
    }

    return quoteList;
  }
}
