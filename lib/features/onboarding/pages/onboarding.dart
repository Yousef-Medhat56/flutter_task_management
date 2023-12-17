import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:task_management/common/utils/constants.dart';
import 'package:task_management/common/widgets/appstyle.dart';
import 'package:task_management/common/widgets/spacers/width_spacer.dart';
import 'package:task_management/common/widgets/text.dart';
import 'package:task_management/features/onboarding/widgets/screens/screen_one.dart';
import 'package:task_management/features/onboarding/widgets/screens/screen_two.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingState();
}

class _OnboardingState extends State<OnboardingPage> {
  final PageController pageController = PageController();

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            physics: const AlwaysScrollableScrollPhysics(),
            controller: pageController,
            children: const [ScreenOne(), ScreenTwo()],
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () => pageController.nextPage(
                                  duration: const Duration(milliseconds: 400),
                                  curve: Curves.ease),
                              child: const Icon(Ionicons.chevron_forward_circle,
                                  size: 30, color: AppConsts.kLight),
                            ),
                            const WidthSpacer(width: 8),
                            MyText(
                                text: "Skip",
                                style: textStyle(
                                    16, AppConsts.kLight, FontWeight.w500)),
                          ],
                        ),
                        SmoothPageIndicator(
                            controller: pageController,
                            count: 2,
                            effect: const WormEffect(
                              activeDotColor: AppConsts.kYellow,
                              dotHeight: 12,
                              dotWidth: 12,
                              spacing: 8,
                            ),
                            onDotClicked: (index) =>
                                pageController.animateToPage(
                                  index,
                                  duration: const Duration(milliseconds: 400),
                                  curve: Curves.ease,
                                )),
                      ])))
        ],
      ),
    );
  }
}
