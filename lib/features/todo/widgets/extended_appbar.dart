import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:task_management/common/utils/constants.dart';
import 'package:task_management/common/widgets/appstyle.dart';
import 'package:task_management/common/widgets/input/text_field.dart';
import 'package:task_management/common/widgets/spacers/height_spacer.dart';
import 'package:task_management/common/widgets/text.dart';

class ExtendedAppBar extends StatelessWidget implements PreferredSizeWidget {
  ExtendedAppBar({super.key});

  final double appBarHeight = 120.h;
  final TextEditingController searchController = TextEditingController();

  @override
  PreferredSize build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(appBarHeight),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyText(
                  text: "Dashboard",
                  style: textStyle(22, AppConsts.kLight, FontWeight.bold),
                ),
                Container(
                  width: 32.w,
                  height: 32.h,
                  decoration: const BoxDecoration(
                    color: AppConsts.kLight,
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  child: GestureDetector(
                    //TODO: add onTap handler
                    onTap: () {},
                    child: const Icon(
                      Icons.add,
                      color: AppConsts.kBkDark,
                    ),
                  ),
                )
              ],
            ),
          ),
          const HeightSpacer(height: 28),
          CustomTextField(
            hintText: "Search",
            hintStyle: textStyle(16, AppConsts.kGreyLight, FontWeight.w400),
            controller: searchController,
            prefixIcon: Container(
              padding: EdgeInsets.symmetric(horizontal: 14.w),
              child: const Icon(
                AntDesign.search1,
                color: AppConsts.kGreyLight,
              ),
            ),
            suffixIcon:
                const Icon(FontAwesome.sliders, color: AppConsts.kGreyLight),
          ),
          const HeightSpacer(height: 20)
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBarHeight);
}
