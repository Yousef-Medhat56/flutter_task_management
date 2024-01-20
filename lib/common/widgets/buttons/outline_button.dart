import 'package:flutter/material.dart';
import 'package:task_management/common/widgets/appstyle.dart';
import 'package:task_management/common/widgets/text.dart';

class OutlineBtn extends StatelessWidget {
  final void Function() onTap;
  final double width;
  final double height;
  final Color? bgColor;
  final Color borderColor;
  final String text;
  const OutlineBtn(
      {super.key,
      required this.onTap,
      required this.width,
      required this.height,
      this.bgColor,
      required this.borderColor,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(width: 1, color: borderColor)),
          child: Center(
            child: MyText(
                text: text, style: textStyle(18, borderColor, FontWeight.bold)),
          ),
        ));
  }
}
