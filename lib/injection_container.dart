import 'package:dio/dio.dart';
import 'package:flutternews/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:flutternews/features/daily_news/data/data_sources/remote/news_api_service_impl.dart';
import 'package:flutternews/features/daily_news/data/repositories/article_repository_impl.dart';
import 'package:flutternews/features/daily_news/domain/repository/article_repository.dart';
import 'package:flutternews/features/daily_news/domain/usecases/get_article.dart';
import 'package:flutternews/features/daily_news/presentation/bloc/article/remote_article_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> intializeDependecies() async {
  //Dio
  sl.registerSingleton<Dio>(Dio());

  //Dependencies

  sl.registerSingleton<NewsApiService>(NewsApiServiceImpl(sl()));

  sl.registerSingleton<ArticleRepository>(ArticleRepositoryImpl(sl()));

  //Use Cases

  sl.registerSingleton<GetArticleUseCase>(GetArticleUseCase(sl()));

  //Blocs
  sl.registerFactory<RemoteArticleBloc>(
    () => RemoteArticleBloc(sl()),
  );
}
