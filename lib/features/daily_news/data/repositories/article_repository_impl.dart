import 'dart:io';
import 'package:dio/dio.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/resources/data_state.dart';
import '../../domain/repository/article_repository.dart';
import '../data_sources/remote/news_api_service.dart';
import '../models/article.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final NewsApiService _newsApiService;
  ArticleRepositoryImpl(this._newsApiService);

  @override
  Future<DataState<List<ArticleModel>>> getNewsArticles(
      {required String countryQuerry, required String categoryQuerry}) async {
    print(countryQuerry);
    print(categoryQuerry);
    try {
      final httpResponse = await _newsApiService.getNewsArticles(
        apiKey: newsAPIKey,
        country: countryQuerry,
        category: categoryQuerry,
      );

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioExceptionType.unknown,
            requestOptions: httpResponse.response.requestOptions));
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }

  // @override
  // Future<List<ArticleModel>> getSavedArticles() async {
  //   return _appDatabase.articleDAO.getArticles();
  // }

  // @override
  // Future<void> removeArticle(ArticleEntity article) {
  //   return _appDatabase.articleDAO.deleteArticle(ArticleModel.fromEntity(article));
  // }

  // @override
  // Future<void> saveArticle(ArticleEntity article) {
  //   return _appDatabase.articleDAO.insertArticle(ArticleModel.fromEntity(article));
  // }
}
