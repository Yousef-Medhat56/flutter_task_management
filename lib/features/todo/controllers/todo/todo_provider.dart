import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:task_management/common/helpers/db_helper.dart';
import 'package:task_management/common/models/task_model.dart';

part "todo_provider.g.dart";

@riverpod
class TodoState extends _$TodoState {
  @override
  List<TaskModel> build() {
    return [];
  }

  Future<void> refresh() async {
    final data = await DBHelper.getTodos();
    state = data.map((e) => TaskModel.fromJson(e)).toList();
  }

  Future<void> addTodo(TaskModel task) async {
    await DBHelper.insertTodo(task);
    refresh();
  }

  Future<void> updateTodo(int id, TaskModel task) async {
    await DBHelper.updateTodo(id, task);
    refresh();
  }

  Future<void> deleteTodo(int id) async {
    await DBHelper.deleteTodo(id);
    refresh();
  }

  Future<void> markAsComplete(int id) async {
    await DBHelper.completeTodo(id);
    refresh();
  }
}
