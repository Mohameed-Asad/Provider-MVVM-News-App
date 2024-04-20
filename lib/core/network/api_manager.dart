import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/core/config/constants.dart';
import 'package:news_app/core/models/source_model.dart';

import '../models/article_model.dart';

class ApiManager {
  static Future<List<SourceModel>> fetchData(String modelId) async {
    var url = Uri.https(Constants.baseUrl, "/v2/top-headlines/sources",
        {"apiKey": Constants.apiKey, "category": modelId});
    var response = await http.get(url);

    if (response.statusCode == 200) {
      // data is Json object (all the info in the object)
      var data = jsonDecode(response.body);
      var sourcesList = data["sources"] as List;
      List<SourceModel> sourcesListData = [];
      for (var source in sourcesList) {
        sourcesListData.add(SourceModel.fromJson(source));
      }
      return sourcesListData;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  static Future<List<ArticleDataModel>> fetchDataSources(
      String sourceId) async {
    var url = Uri.https(Constants.baseUrl, "/v2/everything",
        {"apiKey": Constants.apiKey, "sources": sourceId});
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var listDataModel = data["articles"] as List;
      List<ArticleDataModel> listArticle = [];
      for (var dataModel in listDataModel) {
        listArticle.add(ArticleDataModel.fromJson(dataModel));
      }
      return listArticle;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}
