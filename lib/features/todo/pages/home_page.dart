import 'package:flutter/material.dart';
import 'package:task_management/common/utils/constants.dart';
import 'package:task_management/common/widgets/appstyle.dart';
import 'package:task_management/common/widgets/text.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MyText(
            text: "Task Management App",
            style: textStyle(24, AppConsts.kBlueLight, FontWeight.bold)),
      ),
    );
  }
}
