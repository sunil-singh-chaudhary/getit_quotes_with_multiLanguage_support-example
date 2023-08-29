import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:getit_quotes_example/quotes/domain/quotemodel.dart';

class QuoteRepository {
  Dio dio = Dio();
  late final quoteModel;
  Future<List<Quote>> getQuote(String quoteUrl) async {
    Response response = await dio.get(quoteUrl);

    final contentType = response.headers['content-type'];
    debugPrint('contentType---> $contentType');
    //application/json so we dont need to jsonDecode() here

    if (response.statusCode == 200) {
      Map<String, dynamic> quoteMap = response.data; // Already a map

      // Extract skip and limit values
      int skip = quoteMap['skip'];
      int limit = quoteMap['limit'];
      int total = quoteMap['total'];

      debugPrint('skip $skip and limit $limit and total $total');

      List<dynamic> quoteList = quoteMap['quotes'];

      quoteModel = quoteList.map((q) => Quote.fromJson(q)).toList();

      //body in http , data in dio
    } else {
      debugPrint('error response ${response.statusMessage}');
    }

    return quoteModel ?? [];
  }
}
