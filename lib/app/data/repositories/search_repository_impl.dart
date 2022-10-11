import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:violin/app/core/api.dart';
import 'package:violin/app/domain/search/models/search_response_model.dart';
import 'package:violin/app/domain/search/search_repository.dart';

class SearchRepositoryImpl implements SearchRepository {
  final dio = Dio(BaseOptions(baseUrl: baseUrl));

  @override
  Future<SearchResultModel?> search(String term) async {
    try {
      final response = await dio.get(
        'search',
        queryParameters: {
          'term': term,
          'limit': 25,
          'entity': 'album',
        },
      );
      log(response.toString());
      return SearchResultModel.fromJson(jsonDecode(response.data));
    } catch (_) {}
  }
}
