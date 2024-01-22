import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_management/common/utils/constants.dart';
import 'package:task_management/common/widgets/appstyle.dart';
import 'package:task_management/common/widgets/buttons/outline_button.dart';
import 'package:task_management/common/widgets/input/text_field.dart';
import 'package:task_management/common/widgets/spacers/height_spacer.dart';
import 'package:task_management/common/widgets/text.dart';
import 'package:task_management/features/auth/pages/otp_page.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final TextEditingController phoneController = TextEditingController();

  Country country = Country(
      phoneCode: "1",
      countryCode: "US",
      e164Sc: 0,
      geographic: true,
      level: 1,
      name: "USA",
      example: "USA",
      displayName: "United States",
      displayNameNoCountryCode: "US",
      e164Key: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: ListView(
        children: [
          const HeightSpacer(height: 100),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Image.asset(
              "assets/images/todo.png",
            ),
          ),
          const HeightSpacer(height: 48),
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 16.w),
            child: MyText(
                text: "Please enter your phone number",
                style: textStyle(16, AppConsts.kLight, FontWeight.w500)),
          ),
          const HeightSpacer(height: 12),
          Center(
            child: CustomTextField(
              keyboardType: TextInputType.number,
              maxLength: 10,
              prefixIcon: Container(
                padding: const EdgeInsets.all(14),
                child: GestureDetector(
                  onTap: () {
                    showCountryPicker(
                        context: context,
                        countryListTheme: CountryListThemeData(
                            backgroundColor: AppConsts.kBkDark,
                            textStyle: const TextStyle(color: AppConsts.kLight),
                            searchTextStyle:
                                const TextStyle(color: AppConsts.kLight),
                            bottomSheetHeight: AppConsts.kHeight * 0.6,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(AppConsts.kRadius),
                              topRight: Radius.circular(AppConsts.kRadius),
                            )),
                        onSelect: (code) {
                          setState(() {
                            country = code;
                          });
                        });
                  },
                  child: MyText(
                      text: "${country.flagEmoji}+${country.phoneCode}",
                      style: textStyle(18, AppConsts.kBkDark, FontWeight.bold)),
                ),
              ),
              hintText: "enter phone number",
              hintStyle: textStyle(16, AppConsts.kGreyDk, FontWeight.w400),
              controller: phoneController,
            ),
          ),
          const HeightSpacer(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: OutlineBtn(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => const OtpPage())));
                },
                width: AppConsts.kWidth * 0.9,
                height: AppConsts.kHeight * 0.07,
                borderColor: AppConsts.kBkDark,
                bgColor: AppConsts.kLight,
                text: "Send code"),
          )
        ],
      ),
    )));
  }
}
