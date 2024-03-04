import 'package:flutter/material.dart';
import 'package:news_app/core/config/app_theme_manager.dart';
import 'package:news_app/core/config/constants.dart';

import 'drawer_item.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: Constants.mediaQuery.width * 0.8,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            alignment: const Alignment(0.0, 0.4),
            color: AppThemeManager.primaryColor,
            height: Constants.mediaQuery.height * 0.18,
            child: Text(
              "News App!",
              style:
                  Constants.theme.textTheme.titleLarge?.copyWith(fontSize: 26),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          const DrawerItem(itemIcon: Icons.list, itemName: "Categories"),
          const DrawerItem(itemIcon: Icons.settings, itemName: "Settings")
        ],
      ),
    );
  }
}
