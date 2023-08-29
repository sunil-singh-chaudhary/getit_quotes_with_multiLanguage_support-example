import 'package:get_it/get_it.dart';
import 'package:getit_quotes_example/quotes/repository/quoterepo.dart';

import 'quotes/repository/singlequoterepo.dart';

final locator = GetIt.instance;

void setUpLocator() {
  locator.registerLazySingleton<QuoteRepository>(() => QuoteRepository());
  locator.registerLazySingleton<SingleQuoteRepository>(
      () => SingleQuoteRepository());
}
