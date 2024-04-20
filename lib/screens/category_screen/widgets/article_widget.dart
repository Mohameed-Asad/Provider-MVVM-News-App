import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/models/article_model.dart';

import '../../../core/config/constants.dart';

class ArticleItemWidget extends StatelessWidget {
  final ArticleDataModel articleDataModel;

  const ArticleItemWidget({super.key, required this.articleDataModel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 230,
              width: Constants.mediaQuery.width,
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: CachedNetworkImage(
                imageUrl: articleDataModel.imagePath,
                imageBuilder: (context, imageProvider) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.0),
                      image: DecorationImage(
                          image: imageProvider, fit: BoxFit.cover),
                    ),
                  );
                },
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => const Icon(
                  Icons.error,
                  color: Colors.grey,
                  size: 45,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              articleDataModel.source.name,
              textAlign: TextAlign.start,
              style: Constants.theme.textTheme.bodySmall
                  ?.copyWith(color: const Color(0xFF79828B)),
            ),
            const SizedBox(height: 4),
            Text(
              articleDataModel.title,
              textAlign: TextAlign.start,
              style: Constants.theme.textTheme.bodyMedium?.copyWith(
                  color: const Color(0xFF42505C), fontSize: 18, height: 1.1),
            ),
          ],
        ),
      ),
    );
  }
}
