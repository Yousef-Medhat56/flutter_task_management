import 'package:flutter/material.dart';
import 'package:task_management/common/utils/constants.dart';

class ScreenOne extends StatelessWidget {
  const ScreenOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppConsts.kWidth,
      height: AppConsts.kHeight,
      color: AppConsts.kBkDark,
    );
  }
}
