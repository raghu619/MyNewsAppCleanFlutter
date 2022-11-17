import 'package:mynews_app_clean/core/failures_successes/exceptions.dart';
import 'package:mynews_app_clean/core/services/api_service.dart';
import 'package:mynews_app_clean/features/show_news/data/models/news_info_model.dart';

abstract class FetchFromRemoteDS {
  Future<List<NewsInfoModel>> fetchNews(String? searchText);
}

class FetchFromRemoteDSImpl implements FetchFromRemoteDS {
  final ApiService apiService;

  FetchFromRemoteDSImpl(this.apiService);

  @override
  Future<List<NewsInfoModel>> fetchNews(String? searchText) async {
    try {
      Map<String, dynamic> data = await apiService.getData();
      List list = data['articles'];
      List<Map<String, dynamic>> mapList = [];
      for (int i = 0; i < list.length; i++) {
        Map<String, dynamic> map = list[i] as Map<String, dynamic>;
        mapList.add(map);
      }
      List<NewsInfoModel> news = [];
      for (int i = 0; i < mapList.length; i++) {
        NewsInfoModel newsInfoModel = NewsInfoModel.fromMap(mapList[i]);
        news.add(newsInfoModel);
      }

      return news;
    } catch (e) {
      throw const FetchException(message: 'Failed to get data');
    }
  }
}
