import 'package:dartz/dartz.dart';
import 'package:news_app_clean_architecture/domain/news_repository/news_repository.dart';

import '../../core/core.dart';
import '../../data/data.dart';

class NewsUsecase {
  final NewsRepository newsRepository;
  NewsUsecase({
    required this.newsRepository,
  });

  Future<Either<FetchFailure, List<NewsEntities>>> call(String? searchText) => newsRepository.fetchNews(searchText);
}
