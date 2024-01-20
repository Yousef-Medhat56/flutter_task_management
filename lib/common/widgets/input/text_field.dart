import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_management/common/utils/constants.dart';
import 'package:task_management/common/widgets/appstyle.dart';

class CustomTextField extends StatelessWidget {
  final TextInputType? keyboardType;
  final String? hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextStyle? hintStyle;
  final int? maxLength;
  final TextEditingController controller;
  final void Function(String)? onChanged;

  const CustomTextField(
      {super.key,
      this.keyboardType = TextInputType.text,
      this.hintText,
      this.suffixIcon,
      this.prefixIcon,
      this.hintStyle,
      required this.controller,
      this.onChanged,
      this.maxLength});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppConsts.kWidth * 0.9,
      height: 60.h,
      decoration: BoxDecoration(
          color: AppConsts.kLight,
          borderRadius: BorderRadius.circular(AppConsts.kRadius)),
      child: TextFormField(
        maxLength: maxLength,
        keyboardType: keyboardType,
        controller: controller,
        cursorHeight: 25,
        onChanged: onChanged,
        style: textStyle(18, AppConsts.kBkDark, FontWeight.w700),
        decoration: InputDecoration(
          counterText: "",
          hintText: hintText,
          suffixIcon: suffixIcon,
          suffixIconColor: AppConsts.kBkDark,
          prefixIcon: prefixIcon,
          hintStyle: hintStyle,
          errorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.zero,
              borderSide: BorderSide(color: AppConsts.kRed, width: 0.5)),
          focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.zero,
              borderSide: BorderSide(color: Colors.transparent, width: 0.5)),
          focusedErrorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.zero,
              borderSide: BorderSide(color: AppConsts.kRed, width: 0.5)),
          disabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.zero,
              borderSide: BorderSide(color: AppConsts.kGreyDk, width: 0.5)),
          enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.zero,
              borderSide: BorderSide(color: AppConsts.kBkDark, width: 0.5)),
        ),
      ),
    );
  }
}
