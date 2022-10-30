import 'package:dartz/dartz.dart';
import 'package:mynews_app_clean/core/failures_successes/failure.dart';
import 'package:mynews_app_clean/features/show_news/domain/entities/news_info.dart';

abstract class FetchRepo {
  Future<Either<Failure, List<NewsInfo>>> fetchNews(String? searchText);
}
