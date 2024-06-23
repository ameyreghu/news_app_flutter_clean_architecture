

import 'package:flutternews/core/resources/data_state.dart';

import '../entities/article.dart';

abstract class ArticleRepository {
  // API methods
  Future<DataState<List<ArticleEntity>>> getNewsArticles({required String countryQuerry,required String categoryQuerry});

  // // Database methods
  // Future < List < ArticleEntity >> getSavedArticles();

  // Future < void > saveArticle(ArticleEntity article);

  // Future < void > removeArticle(ArticleEntity article);
}