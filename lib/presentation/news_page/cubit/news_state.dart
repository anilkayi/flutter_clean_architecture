part of 'news_cubit.dart';


abstract class NewsState {}

class NewsInitial extends NewsState {}

class NewsLoading extends NewsState {}

class NewsSucces extends NewsState {
  final List<NewsEntities> newsEntitiesList;
  NewsSucces({
    required this.newsEntitiesList,
  }) : super();
}

class NewsError extends NewsState {}
