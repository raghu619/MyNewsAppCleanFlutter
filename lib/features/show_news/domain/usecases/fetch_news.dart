import 'package:dartz/dartz.dart';
import 'package:mynews_app_clean/features/show_news/domain/entities/news_info.dart';

import '../../../../core/failures_successes/failure.dart';
import '../repositories/fetch_repo_contract.dart';

class FetchNewsUsecases {
  final FetchRepo fetchRepo;
  FetchNewsUsecases({required this.fetchRepo});

  Future<Either<Failure, List<NewsInfo>>> fetchNews(String? searchText) {
    return fetchRepo.fetchNews(searchText);
  }
}
