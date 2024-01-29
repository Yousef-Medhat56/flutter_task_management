import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_management/common/utils/constants.dart';
import 'package:task_management/common/widgets/appstyle.dart';
import 'package:task_management/common/widgets/spacers/height_spacer.dart';
import 'package:task_management/common/widgets/spacers/width_spacer.dart';
import 'package:task_management/common/widgets/text.dart';
import 'package:task_management/features/todo/controllers/todo/todo_provider.dart';
import 'package:task_management/features/todo/widgets/completed_tasks.dart';
import 'package:task_management/features/todo/widgets/day_after_tomorrow_tasks.dart';
import 'package:task_management/features/todo/widgets/extended_appbar.dart';
import 'package:task_management/features/todo/widgets/today_tasks_list.dart';
import 'package:task_management/features/todo/widgets/tomorrow_tasks_list.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage>
    with TickerProviderStateMixin {
  late final TabController tabController =
      TabController(length: 2, vsync: this);

  final String dayAfterTomorrow =
      DateTime.now().add(const Duration(days: 2)).toString().substring(5, 10);

  @override
  Widget build(BuildContext context) {
    ref.read(todoStateProvider.notifier).refresh();

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          bottom: ExtendedAppBar()),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: ListView(
            children: [
              const HeightSpacer(height: 25),
              Row(
                children: [
                  const Icon(FontAwesome.tasks,
                      size: 20, color: AppConsts.kLight),
                  const WidthSpacer(width: 8),
                  MyText(
                      text: "Today's Tasks",
                      style: textStyle(18, AppConsts.kLight, FontWeight.bold))
                ],
              ),
              const HeightSpacer(height: 26),
              Container(
                decoration: BoxDecoration(
                    color: AppConsts.kLight,
                    borderRadius: BorderRadius.circular(AppConsts.kRadius)),
                child: TabBar(
                    indicatorSize: TabBarIndicatorSize.label,
                    indicator: BoxDecoration(
                      color: AppConsts.kGreyLight,
                      borderRadius: BorderRadius.all(
                        Radius.circular(AppConsts.kRadius),
                      ),
                    ),
                    dividerColor: Colors.transparent,
                    controller: tabController,
                    labelPadding: EdgeInsets.zero,
                    isScrollable: false,
                    labelColor: AppConsts.kBlueLight,
                    labelStyle:
                        textStyle(24, AppConsts.kBlueLight, FontWeight.bold),
                    unselectedLabelColor: AppConsts.kLight,
                    tabs: [
                      Tab(
                        child: SizedBox(
                          width: AppConsts.kWidth * 0.5,
                          child: Center(
                            child: MyText(
                                text: "Pending",
                                style: textStyle(
                                    16, AppConsts.kBkDark, FontWeight.bold)),
                          ),
                        ),
                      ),
                      Tab(
                        child: Container(
                          padding: EdgeInsets.only(left: 30.w),
                          width: AppConsts.kWidth * 0.5,
                          child: Center(
                            child: MyText(
                                text: "Completed",
                                style: textStyle(
                                    16, AppConsts.kBkDark, FontWeight.bold)),
                          ),
                        ),
                      )
                    ]),
              ),
              const HeightSpacer(height: 20),
              SizedBox(
                height: AppConsts.kHeight * 0.3,
                width: AppConsts.kWidth,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(
                    Radius.circular(AppConsts.kRadius),
                  ),
                  child: TabBarView(controller: tabController, children: [
                    Container(
                      color: AppConsts.kBkLight,
                      height: AppConsts.kHeight * 0.3,
                      child: const TodayTasksList(),
                    ),
                    Container(
                      color: AppConsts.kGreyLight,
                      height: AppConsts.kHeight * 0.3,
                      child: const CompletedTasksList(),
                    ),
                  ]),
                ),
              ),
              const HeightSpacer(height: 24),
              const TomorrowTasksList(),
              const HeightSpacer(height: 24),
              const DayAfterTomorrowTasksList(),
              const HeightSpacer(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
