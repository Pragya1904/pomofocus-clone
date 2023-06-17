import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import '../providers/TimerProvider.dart';

class AppBarAction extends StatelessWidget {
  const AppBarAction({
    super.key,
    required this.width,
    required this.icon,
    required this.height,
    required this.onPress,
  });
  final dynamic icon;
  final double width;
  final dynamic onPress;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Consumer<TimerProvider>(
        builder: (context, timerProvider, child) => Container(
            width: width * 0.121,
            margin: EdgeInsets.symmetric(
                horizontal: width * 0.0096, vertical: height * 0.0095),
            decoration: BoxDecoration(
                color: timerProvider.option == 1
                    ? iconBtnRed
                    : timerProvider.option == 2
                    ? iconBtnGreen
                    : iconBtnBlue,
                borderRadius: BorderRadius.circular(5.0)),
            child: IconButton(
              onPressed: onPress,
              icon: Icon(
                icon,
                color: Colors.white,
                size: height * 0.032,
              ),
            )));
  }
}