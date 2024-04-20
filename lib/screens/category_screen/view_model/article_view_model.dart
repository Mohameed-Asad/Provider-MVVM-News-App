import 'package:flutter/material.dart';
import 'package:news_app/core/models/article_model.dart';

import '../../../core/network/api_manager.dart';

class ArticlesViewModel extends ChangeNotifier {
  List<ArticleDataModel> _articlesList = [];

  List<ArticleDataModel> get articlesList => _articlesList;

  getNewsArticles(String sourceId) async {
    try {
      _articlesList = await ApiManager.fetchDataSources(sourceId);
      notifyListeners();
    } catch (error) {
      print(error.toString());
    }
  }
}
