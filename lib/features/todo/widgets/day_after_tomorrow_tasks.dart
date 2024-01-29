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

class DayAfterTomorrowTasksList extends ConsumerWidget {
  const DayAfterTomorrowTasksList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allTasks = ref.watch(todoStateProvider);
    String dayAfterTomorrow = getDayAfterTomorrow();
    List<TaskModel> dayAfterTomorrowTasks = allTasks
        .where(
          (element) => element.date!.contains(dayAfterTomorrow),
        )
        .toList();
    return CustomExpansionTile(
      title: dayAfterTomorrow.substring(5, 10),
      subtitle: "${dayAfterTomorrow.substring(5, 10)} tasks are shown here",
      onExpansionChanged: (bool isExpanded) {
        ref.read(expansionState0Provider.notifier).setState(!isExpanded);
      },
      trailing: Padding(
        padding: const EdgeInsets.only(right: 12),
        child: ref.watch(expansionState0Provider)
            ? const Icon(
                AntDesign.circledown,
                color: AppConsts.kLight,
              )
            : const Icon(AntDesign.closecircleo, color: AppConsts.kBlueLight),
      ),
      children: [
        for (final task in dayAfterTomorrowTasks)
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
