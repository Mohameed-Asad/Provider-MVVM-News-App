import 'package:flutter/material.dart';

class BackGroundWidget extends StatelessWidget {
  final Widget? child;

  const BackGroundWidget({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
                image: AssetImage("assets/images/patternground.png"),
                fit: BoxFit.cover)),
        child: child);
  }
}
