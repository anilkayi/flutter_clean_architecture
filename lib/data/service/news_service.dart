import 'package:news_app_clean_architecture/data/models/news_models.dart';

abstract class NewsService {
  Future<List<NewsModels>> fetchNews(String? searchText);
}
