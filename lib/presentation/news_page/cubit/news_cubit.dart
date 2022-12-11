import 'package:bloc/bloc.dart';

import '../../../data/entities/news_entities/news_entities.dart';
import '../../../domain/news_usecase/news_usecase.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit({required this.newsUsecase}) : super(NewsInitial());

  final NewsUsecase newsUsecase;

  Future<void> fetchNews(String? searchText) async {
    emit(NewsLoading());

    final fetchNewsResult = await newsUsecase.call(searchText);
    fetchNewsResult.fold((l) => emit(NewsError()), (List<NewsEntities> r) {
      emit(
        NewsSucces(newsEntitiesList: r),
      );
    });
  }
}
