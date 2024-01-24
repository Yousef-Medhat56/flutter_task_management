import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:task_management/common/utils/constants.dart';
import 'package:task_management/common/widgets/appstyle.dart';
import 'package:task_management/common/widgets/spacers/height_spacer.dart';
import 'package:task_management/common/widgets/spacers/width_spacer.dart';
import 'package:task_management/common/widgets/text.dart';

class TodoTile extends StatelessWidget {
  const TodoTile(
      {super.key,
      this.color,
      required this.title,
      required this.description,
      required this.start,
      required this.end,
      this.editWidget,
      this.deleteTodo,
      this.switcher});

  final String title;
  final String description;
  final String start;
  final String end;
  final Color? color;
  final Widget? editWidget;
  final void Function()? deleteTodo;
  final Widget? switcher;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            width: AppConsts.kWidth,
            decoration: BoxDecoration(
              color: AppConsts.kGreyLight,
              borderRadius: BorderRadius.circular(AppConsts.kRadius),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: 80.h,
                      width: 5.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(AppConsts.kRadius),
                          ),
                          //TODO: Make the color dynamic
                          color: color ?? AppConsts.kRed),
                    ),
                    const WidthSpacer(width: 16),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyText(
                            text: title,
                            style: textStyle(
                                18, AppConsts.kLight, FontWeight.bold),
                          ),
                          const HeightSpacer(height: 4),
                          MyText(
                            text: description,
                            style: textStyle(
                                12, AppConsts.kLight, FontWeight.normal),
                          ),
                          const HeightSpacer(height: 12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                width: AppConsts.kWidth * 0.3,
                                height: 24.h,
                                decoration: BoxDecoration(
                                  color: AppConsts.kBkDark,
                                  border: Border.all(
                                      width: 0.3, color: AppConsts.kGreyDk),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(AppConsts.kRadius),
                                  ),
                                ),
                                child: Center(
                                  child: MyText(
                                      text: "$start | $end",
                                      style: textStyle(12, AppConsts.kLight,
                                          FontWeight.normal)),
                                ),
                              ),
                              WidthSpacer(width: 20),
                              Row(
                                children: [
                                  SizedBox(
                                    child: editWidget,
                                  ),
                                  WidthSpacer(width: 12),
                                  GestureDetector(
                                    onTap: deleteTodo,
                                    child: const Icon(
                                        MaterialCommunityIcons.delete_circle),
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 0),
                  child: switcher,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
