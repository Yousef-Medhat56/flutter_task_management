import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_management/common/models/task_model.dart';
import 'package:task_management/common/utils/constants.dart';
import 'package:task_management/common/widgets/appstyle.dart';
import 'package:task_management/common/widgets/buttons/outline_button.dart';
import 'package:task_management/common/widgets/input/text_field.dart';
import 'package:task_management/common/widgets/spacers/height_spacer.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart'
    as picker;
import 'package:task_management/features/todo/controllers/dates/dates_provider.dart';
import 'package:task_management/features/todo/controllers/todo/todo_provider.dart';

class AddTodoPage extends ConsumerStatefulWidget {
  const AddTodoPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddTodoPageState();
}

class _AddTodoPageState extends ConsumerState<AddTodoPage> {
  final TextEditingController todoTitleController = TextEditingController();
  final TextEditingController todoDescController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var todoDate = ref.watch(dateStateProvider);
    var todoStartTime = ref.watch(startTimeStateProvider);
    var todoFinishTime = ref.watch(finishTimeStateProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add New Task",
          style: textStyle(18, Colors.white, FontWeight.w600),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        child: ListView(
          children: [
            const HeightSpacer(height: 20),
            CustomTextField(
              controller: todoTitleController,
              hintText: "Title",
              hintStyle: textStyle(16, AppConsts.kGreyLight, FontWeight.w600),
            ),
            const HeightSpacer(height: 12),
            CustomTextField(
              controller: todoDescController,
              hintText: "Description",
              hintStyle: textStyle(16, AppConsts.kGreyLight, FontWeight.w600),
            ),
            const HeightSpacer(height: 12),
            OutlineBtn(
              //TODO: Add tap handler
              onTap: () {
                picker.DatePicker.showDatePicker(context,
                    showTitleActions: true,
                    minTime: DateTime.now(),
                    maxTime: DateTime.now().add(const Duration(days: 365)),
                    onConfirm: (date) {
                  ref
                      .read(dateStateProvider.notifier)
                      .setDate(date.toString().substring(0, 10));
                }, currentTime: DateTime.now(), locale: picker.LocaleType.en);
              },
              width: AppConsts.kWidth,
              height: 52.h,
              borderColor: AppConsts.kLight,
              bgColor: AppConsts.kBlueLight,
              text: todoDate.isNotEmpty ? todoDate : "Set date",
            ),
            const HeightSpacer(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlineBtn(
                  onTap: () {
                    picker.DatePicker.showTimePicker(
                      context,
                      showTitleActions: true,
                      showSecondsColumn: false,
                      onConfirm: (date) {
                        ref.read(startTimeStateProvider.notifier).setStartTime(
                              date.toString().substring(10, 16),
                            );
                      },
                      currentTime: DateTime.now(),
                    );
                  },
                  width: AppConsts.kWidth * 0.45,
                  height: 52.h,
                  borderColor: AppConsts.kLight,
                  bgColor: AppConsts.kBlueLight,
                  text: todoStartTime.isNotEmpty ? todoStartTime : "Start time",
                ),
                OutlineBtn(
                  onTap: () {
                    picker.DatePicker.showDateTimePicker(
                      context,
                      showTitleActions: true,
                      minTime: DateTime.now(),
                      onConfirm: (date) {
                        ref
                            .read(finishTimeStateProvider.notifier)
                            .setFinishTime(
                              date.toString().substring(10, 16),
                            );
                      },
                      currentTime: DateTime.now(),
                    );
                  },
                  width: AppConsts.kWidth * 0.45,
                  height: 52.h,
                  borderColor: AppConsts.kLight,
                  bgColor: AppConsts.kBlueLight,
                  text: todoFinishTime.isNotEmpty ? todoFinishTime : "End time",
                )
              ],
            ),
            const HeightSpacer(height: 20),
            OutlineBtn(
              onTap: () {
                if (todoTitleController.text.isNotEmpty &&
                    todoDescController.text.isNotEmpty &&
                    todoDate.isNotEmpty &&
                    todoStartTime.isNotEmpty &&
                    todoFinishTime.isNotEmpty) {
                  TaskModel task = TaskModel(
                      title: todoTitleController.text,
                      desc: todoDescController.text,
                      date: todoDate,
                      startTime: todoStartTime,
                      endTime: todoFinishTime,
                      isCompleted: 0,
                      remind: 0,
                      repeat: "yes");
                  //add new task
                  ref.read(todoStateProvider.notifier).addTodo(task);
                  //clear date and time providers
                  ref.read(dateStateProvider.notifier).setDate("");
                  ref.read(startTimeStateProvider.notifier).setStartTime("");
                  ref.read(finishTimeStateProvider.notifier).setFinishTime("");

                  Navigator.pop(context);
                } else {
                  debugPrint("Failed to insert new task");
                }
              },
              width: AppConsts.kWidth,
              height: 52.h,
              borderColor: AppConsts.kLight,
              bgColor: AppConsts.kGreen,
              text: "Submit",
            ),
          ],
        ),
      ),
    );
  }
}
