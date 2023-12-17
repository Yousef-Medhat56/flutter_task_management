import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_management/common/utils/constants.dart';
import 'package:task_management/common/widgets/appstyle.dart';
import 'package:task_management/common/widgets/spacers/height_spacer.dart';
import 'package:task_management/common/widgets/text.dart';

class ScreenOne extends StatelessWidget {
  const ScreenOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppConsts.kWidth,
      height: AppConsts.kHeight,
      color: AppConsts.kBkDark,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 30.w,
              ),
              child: Image.asset("assets/images/todo.png")),
          const HeightSpacer(height: 82),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MyText(
                text: "Task Management",
                style: textStyle(28, AppConsts.kLight, FontWeight.w600),
              ),
              const HeightSpacer(height: 8),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Text(
                  "A simple and easy way to manage your tasks",
                  textAlign: TextAlign.center,
                  style: textStyle(16, Colors.white60, FontWeight.normal),
                ),
              ),
            ],
          ),
          const HeightSpacer(height: 12)
        ],
      ),
    );
  }
}
