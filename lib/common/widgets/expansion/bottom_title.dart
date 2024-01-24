import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_management/common/utils/constants.dart';
import 'package:task_management/common/widgets/appstyle.dart';
import 'package:task_management/common/widgets/spacers/height_spacer.dart';
import 'package:task_management/common/widgets/spacers/width_spacer.dart';
import 'package:task_management/common/widgets/text.dart';

class BottomTitle extends StatelessWidget {
  const BottomTitle(
      {super.key,
      required this.title,
      required this.subtitle,
      this.borderColor});

  final String title;
  final String subtitle;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppConsts.kWidth,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Consumer(
              builder: (context, ref, child) {
                return Container(
                  height: 80.h,
                  width: 5.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(AppConsts.kRadius),
                      ),
                      //TODO: Make the color dynamic
                      color: AppConsts.kGreen),
                );
              },
            ),
            const WidthSpacer(width: 12),
            Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText(
                    text: title,
                    style: textStyle(24, AppConsts.kLight, FontWeight.w700),
                  ),
                  const HeightSpacer(height: 12),
                  MyText(
                    text: subtitle,
                    style: textStyle(12, AppConsts.kLight, FontWeight.normal),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
