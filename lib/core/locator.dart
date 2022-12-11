import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:news_app_clean_architecture/data/service/news_service.dart';
import 'package:news_app_clean_architecture/data/service/news_service_impl.dart';

import '../domain/domain.dart';

GetIt getIt = GetIt.instance;

Future<void> initiAlizeLocator() async {
  getIt.registerLazySingleton<NewsService>(
    () => NewsServiceImpl(dio: Dio()),
  );

  getIt.registerLazySingleton<NewsRepository>(
    () => NewsRepository(newsService: getIt<NewsService>()),
  );

  getIt.registerLazySingleton<NewsUsecase>(
    () => NewsUsecase(newsRepository: getIt<NewsRepository>()),
  );
}
