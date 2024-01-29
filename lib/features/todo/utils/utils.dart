import 'dart:math';

import 'package:flutter/material.dart';
import 'package:task_management/common/models/task_model.dart';

String getToday() {
  DateTime today = DateTime.now();
  return today.toString().substring(0, 10);
}

String getTomorrow() {
  DateTime tomorrow = DateTime.now().add(const Duration(days: 1));
  return tomorrow.toString().substring(0, 10);
}

String getDayAfterTomorrow() {
  DateTime dayAfterTomorrow = DateTime.now().add(const Duration(days: 2));
  return dayAfterTomorrow.toString().substring(0, 10);
}

List<String> last30days() {
  DateTime today = DateTime.now();
  DateTime oneMonthAgo = today.subtract(const Duration(days: 30));

  List<String> days = [];

  for (int i = 0; i < 30; i++) {
    DateTime day = oneMonthAgo.add(Duration(days: i));
    days.add(day.toString().substring(0, 10));
  }
  return days;
}

bool getTaskStatus(TaskModel task) {
  bool? isCompleted;
  task.isCompleted! > 0 ? isCompleted = true : isCompleted = false;
  return isCompleted;
}

Color getRandomColor() {
  Random random = Random();
  List<Color> colorList = const [
    Color(0xFFd80000),
    Color(0xFF027eb5),
    Color(0xFFF9F900),
    Color(0xFF20a31E)
  ];
  int index = random.nextInt(colorList.length);
  return colorList[index];
}
