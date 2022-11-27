import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:mynews_app_clean/core/failures_successes/failure.dart';
import 'package:mynews_app_clean/features/show_news/domain/usecases/fetch_news.dart';

import '../../../../core/services_locator.dart';
import '../../domain/entities/news_info.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial(news: const []));
  final FetchNewsUsecases _fetchNewsUsecase = sl<FetchNewsUsecases>();

  void fetchNews(String? searchText) async {
    emit(NewsLoading());
    final Either<Failure, List<NewsInfo>> fetchNewsResult =
        await _fetchNewsUsecase.fetchNews(searchText);
    fetchNewsResult.fold((l) {
      emit(NewsError());
    }, (news) {
      if (searchText != null) {
        emit(NewsInitialSearch(news: news));
      } else {
        emit(NewsInitial(news: news));
      }
    });
  }
}
