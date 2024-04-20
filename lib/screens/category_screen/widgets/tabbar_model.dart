import 'package:flutter/material.dart';
import 'package:news_app/core/config/app_theme_manager.dart';
import 'package:news_app/core/config/constants.dart';
import 'package:news_app/core/models/source_model.dart';

class TabModel extends StatelessWidget {
  final bool isClicked;
  final SourceModel sourceModel;

  const TabModel(
      {super.key, required this.sourceModel, required this.isClicked});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 7),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: isClicked ? AppThemeManager.primaryColor : Colors.transparent,
          border: Border.all(color: AppThemeManager.primaryColor, width: 2)),
      child: Text(
        sourceModel.name,
        style: Constants.theme.textTheme.bodyMedium?.copyWith(
            color: isClicked ? Colors.white : AppThemeManager.primaryColor),
      ),
    );
  }
}
