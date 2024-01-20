import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_management/common/utils/constants.dart';
import 'package:task_management/common/widgets/buttons/outline_button.dart';
import 'package:task_management/common/widgets/spacers/height_spacer.dart';
import 'package:task_management/features/auth/pages/login_page.dart';

class ScreenTwo extends StatelessWidget {
  const ScreenTwo({super.key});

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
              horizontal: 40.w,
            ),
            child: Image.asset("assets/images/todo.png"),
          ),
          const HeightSpacer(height: 60),
          OutlineBtn(
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const LoginPage()));
              },
              width: AppConsts.kWidth * 0.9,
              height: AppConsts.kHeight * 0.06,
              borderColor: AppConsts.kLight,
              text: "Login with phone number")
        ],
      ),
    );
  }
}
