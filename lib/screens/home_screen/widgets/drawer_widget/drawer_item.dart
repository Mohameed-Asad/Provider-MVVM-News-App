import 'package:flutter/material.dart';

import '../../../../core/config/constants.dart';

class DrawerItem extends StatelessWidget {
  final IconData itemIcon;
  final String itemName;

  const DrawerItem({super.key, required this.itemIcon, required this.itemName});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {},
        child: Row(
          children: [
            Icon(
              itemIcon,
              size: 35,
              color: Colors.black,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              itemName,
              style: Constants.theme.textTheme.titleLarge
                  ?.copyWith(color: Colors.black),
            ),
          ],
        ));
  }
}
