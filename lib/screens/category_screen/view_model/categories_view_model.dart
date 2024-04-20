import 'package:flutter/cupertino.dart';

import '../../../core/models/source_model.dart';
import '../../../core/network/api_manager.dart';

class CategoryViewModel extends ChangeNotifier {
  List<SourceModel> _sourcesList = [];

  List<SourceModel> get sourcesList => _sourcesList;

  getNewsDataSource(String categoryId) async {
    try {
      _sourcesList = await ApiManager.fetchData(categoryId);
      notifyListeners();
    } catch (e) {
      print(
        e.toString(),
      );
    }
  }
}
