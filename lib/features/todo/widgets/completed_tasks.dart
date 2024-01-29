import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:task_management/common/models/task_model.dart';
import 'package:task_management/common/utils/constants.dart';
import 'package:task_management/features/todo/controllers/todo/todo_provider.dart';
import 'package:task_management/features/todo/utils/utils.dart';
import 'package:task_management/features/todo/widgets/todo_tile.dart';

class CompletedTasksList extends ConsumerWidget {
  const CompletedTasksList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<TaskModel> allTasks = ref.watch(todoStateProvider);
    List<String> lastMonth = last30days();
    List<TaskModel> lastMonthTasks = allTasks
        .where(
          (element) =>
              element.isCompleted == 1 || lastMonth.contains(element.date),
        )
        .toList();

    return ListView.builder(
      itemCount: lastMonthTasks.length,
      itemBuilder: (context, index) {
        final task = lastMonthTasks.elementAt(index);
        return TodoTile(
            title: task.title!,
            description: task.desc!,
            start: task.startTime!,
            end: task.endTime!,
            color: getRandomColor(),
            switcher: Icon(
              AntDesign.checkcircle,
              color: AppConsts.kGreen,
            ),
            deleteTodo: () {
              ref.read(todoStateProvider.notifier).deleteTodo(task.id!);
            },
            editWidget: const SizedBox.shrink());
      },
    );
  }
}
