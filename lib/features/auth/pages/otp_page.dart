import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:task_management/common/utils/constants.dart';
import 'package:task_management/common/widgets/appstyle.dart';
import 'package:task_management/common/widgets/spacers/height_spacer.dart';
import 'package:task_management/common/widgets/text.dart';

class OtpPage extends StatelessWidget {
  const OtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: AppConsts.kLight,
      ),
      body: SafeArea(
          child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            HeightSpacer(height: AppConsts.kHeight * 0.12),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 30.w,
              ),
              child: Image.asset(
                "assets/images/todo.png",
                width: AppConsts.kWidth * 0.6,
              ),
            ),
            const HeightSpacer(height: 40),
            MyText(
                text: "Enter your otp code",
                style: textStyle(18, AppConsts.kLight, FontWeight.bold)),
            const HeightSpacer(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Pinput(
                length: 6,
                showCursor: true,
                //TODO: add onCompleted handler
                onCompleted: (value) {
                  if (value.length == 6) {}
                },
                //TODO: add onCompleted handler
                onSubmitted: (value) {},
              ),
            )
          ],
        ),
      )),
    );
  }
}
