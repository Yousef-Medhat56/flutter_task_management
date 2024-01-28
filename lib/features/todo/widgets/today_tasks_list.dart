import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:task_management/common/models/task_model.dart';
import 'package:task_management/features/todo/controllers/todo/todo_provider.dart';
import 'package:task_management/features/todo/utils/utils.dart';
import 'package:task_management/features/todo/widgets/todo_tile.dart';

class TodayTasksList extends ConsumerWidget {
  const TodayTasksList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<TaskModel> allTasks = ref.watch(todoStateProvider);
    String todayDate = getToday();
    List<TaskModel> todayTasks = allTasks
        .where(
          (element) =>
              element.isCompleted == 0 && element.date!.contains(todayDate),
        )
        .toList();

    return ListView.builder(
      itemCount: todayTasks.length,
      itemBuilder: (context, index) {
        final task = todayTasks.elementAt(index);
        return TodoTile(
          title: task.title!,
          description: task.desc!,
          start: task.startTime!,
          end: task.endTime!,
          color: getRandomColor(),
          switcher: Switch(
            value: task.isCompleted != 0,
            //TODO: add change handler
            onChanged: (bool value) {},
          ),
          deleteTodo: () {
            ref.read(todoStateProvider.notifier).deleteTodo(task.id!);
          },
          editWidget: GestureDetector(
            //TODO: add edit handler
            onTap: () {},
            child: const Icon(MaterialCommunityIcons.circle_edit_outline),
          ),
        );
      },
    );
  }
}
