import 'package:news_app/core/models/source_model.dart';

class ArticleDataModel {
  final SourceModel source;
  final String author;
  final String title;
  final String publishedAt;
  final String imagePath;

  ArticleDataModel(
      {required this.source,
      required this.author,
      required this.imagePath,
      required this.title,
      required this.publishedAt});

  factory ArticleDataModel.fromJson(Map<String, dynamic> json) =>
      ArticleDataModel(
          source: SourceModel.fromJson(json["source"]),
          author: json["author"],
          imagePath: json["urlToImage"],
          title: json["title"],
          publishedAt: json["publishedAt"]);
}
