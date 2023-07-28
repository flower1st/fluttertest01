import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'models/TopRated.dart';

class ApiUrls {
  static const String url =
      'https://dev.nail360.info/light/api/public?s=TopRated';

  static List<Data> parseData(String responseBody) {
    var list = json.decode(responseBody) as List<dynamic>;
    List<Data> datas = list.map((model) => Data.fromJson(model)).toList();
    return datas;
  }

  static Future<List<Data>> fetchData({int page = 1}) async {
    final response = await http.get(url as Uri);
    if (response.statusCode == 200) {
      return compute(parseData, response.body);
    } else if (response.statusCode == 404) {
      throw Exception('Not Found');
    } else {
      throw Exception('Can\'t get post');
    }
  }
}
