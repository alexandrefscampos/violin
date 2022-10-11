// ignore_for_file: body_might_complete_normally_nullable

import 'package:violin/app/domain/search/models/search_response_model.dart';

abstract class SearchRepository {
  Future<SearchResultModel?> search(String term) async {}
}
