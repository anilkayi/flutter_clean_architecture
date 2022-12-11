import 'package:dartz/dartz.dart';
import 'package:news_app_clean_architecture/core/failures/failures.dart';
import 'package:news_app_clean_architecture/data/data.dart';

class NewsRepository {
  final NewsService newsService;
  NewsRepository({
    required this.newsService,
  });

  Future<Either<FetchFailure, List<NewsEntities>>> fetchNews(String? searchText) async {
    try {
      return Right(
        await newsService.fetchNews(searchText),
      );
    } catch (e) {
      return Left(
        FetchFailure(message: e.toString()),
      );
    }
  }
}
