import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_management/common/models/task_model.dart';
import 'package:task_management/common/utils/constants.dart';
import 'package:task_management/common/widgets/expansion/expansion_tile.dart';
import 'package:task_management/features/todo/controllers/expansion_provider.dart';
import 'package:task_management/features/todo/controllers/todo/todo_provider.dart';
import 'package:task_management/features/todo/utils/utils.dart';
import 'package:task_management/features/todo/widgets/todo_tile.dart';

class TomorrowTasksList extends ConsumerWidget {
  const TomorrowTasksList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allTasks = ref.watch(todoStateProvider);
    String tomorrowDate = getTomorrow();
    List<TaskModel> tomorrowTasks = allTasks
        .where(
          (element) => element.date!.contains(tomorrowDate),
        )
        .toList();
    return CustomExpansionTile(
      title: "Tomorrow's tasks",
      subtitle: "Tomorrow's tasks are shown here",
      onExpansionChanged: (bool isExpanded) {
        ref.read(expansionStateProvider.notifier).setState(!isExpanded);
      },
      trailing: Padding(
        padding: const EdgeInsets.only(right: 12),
        child: ref.watch(expansionStateProvider)
            ? const Icon(
                AntDesign.circledown,
                color: AppConsts.kLight,
              )
            : const Icon(AntDesign.closecircleo, color: AppConsts.kBlueLight),
      ),
      children: [
        for (final task in tomorrowTasks)
          TodoTile(
              title: task.title!,
              description: task.desc!,
              start: task.startTime!,
              end: task.endTime!,
              color: getRandomColor(),
              switcher: const SizedBox.shrink(),
              deleteTodo: () {
                ref.read(todoStateProvider.notifier).deleteTodo(task.id!);
              })
      ],
    );
  }
}
