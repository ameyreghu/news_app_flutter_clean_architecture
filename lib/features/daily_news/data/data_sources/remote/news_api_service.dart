import 'package:flutternews/features/daily_news/data/models/article.dart';
import 'package:dio/dio.dart';

import '../../../../../core/resources/http_response.dart';

abstract class NewsApiService {
  Future<HttpResponse<List<ArticleModel>>> getNewsArticles(
      {required String apiKey,
      required String country,
      required String category});
}
