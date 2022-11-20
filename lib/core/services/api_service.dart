import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

abstract class ApiService {
  Future<Map<String, dynamic>> getData(
      String url, Map<String, dynamic> queryParams);
}

class ApiServiceImpl implements ApiService {
  @override
  Future<Map<String, dynamic>> getData(
      String url, Map<String, dynamic> queryParams) async {
    final http.Response response = await http.get(
      Uri.parse(url).replace(
        queryParameters: queryParams,
      ),
    );
    if (response.statusCode == 200) {
      return convert.jsonDecode(response.body) as Map<String, dynamic>;
    } else {
      throw Exception('Status code: ${response.statusCode}');
    }
  }
}
