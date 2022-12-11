import 'package:dio/dio.dart';
import 'package:news_app_clean_architecture/data/models/news_models.dart';
import 'package:news_app_clean_architecture/data/service/news_service.dart';

import '../../core/core.dart';

class NewsServiceImpl extends NewsService {
  final Dio dio;
  NewsServiceImpl({
    required this.dio,
  });
  @override
  Future<List<NewsModels>> fetchNews(String? searchText) async {
    final response = await dio.get(searchText != null ? StringConst.everytihgUrl : StringConst.topHeadlinesUrl,
        queryParameters: {
          'apiKey': StringConst.apiKey,
          if (searchText == null) 'country': 'us',
          if (searchText != null) 'q': searchText
        });
    List list = response.data['articles'];
    List<Map<String, dynamic>> mapList = [];
    for (int i = 0; i < list.length; i++) {
      Map<String, dynamic> map = list[i];
      mapList.add(map);
    }
    List<NewsModels> newsList = [];
    for (int i = 0; i < mapList.length; i++) {
      NewsModels newsModels = NewsModels.fromJson(
        mapList[i],
      );
      newsList.add(newsModels);
    }
    return newsList;
  }
}
