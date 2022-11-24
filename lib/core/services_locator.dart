import 'package:get_it/get_it.dart';
import 'package:mynews_app_clean/core/services/api_service.dart';
import 'package:mynews_app_clean/features/show_news/data/data_sources/fetch_from_remote_ds.dart';
import 'package:mynews_app_clean/features/show_news/domain/repositories/fetch_repo_contract.dart';
import 'package:mynews_app_clean/features/show_news/domain/usecases/fetch_news.dart';

import '../features/show_news/data/repositories/fetch_repo_impl.dart';

final GetIt sl = GetIt.asNewInstance();

void setUpServices() {
  sl.registerSingleton<ApiService>(ApiServiceImpl());
  sl.registerSingleton<FetchFromRemoteDS>(FetchFromRemoteDSImpl());
  sl.registerSingleton<FetchRepo>(FetchRepoImpl());
  sl.registerSingleton<FetchNewsUsecases>(FetchNewsUsecases());
}
