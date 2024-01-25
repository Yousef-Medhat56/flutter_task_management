import "package:flutter/material.dart";
import "package:sqflite/sqflite.dart";
import "package:task_management/common/models/task_model.dart";

class DBHelper {
  // create the tables
  static Future<void> createTables(Database db) async {
    //create Todo table
    await db.execute(
      "CREATE TABLE Todo("
      "id INTEGER PRIMARY KEY AUTOINCREMENT,"
      "title STRING,"
      "desc TEXT,"
      "isCompleted INTEGER,"
      "date STRING,"
      "startTime STRING,"
      "endTime STRING,"
      "reminder INTEGER,"
      "repeat STRING"
      ")",
    );

    //create User table
    await db.execute(
      "CREATE TABLE User("
      "id INTEGER PRIMARY KEY AUTOINCREMENT DEFAULT 0,"
      "isVerified INTEGER NOT NULL"
      ")",
    );
  }

  // return the database
  static Future<Database> db() async {
    return openDatabase(
      "task_managment",
      version: 1,
      onCreate: (Database database, int version) async {
        await createTables(database);
      },
    );
  }

  //insert new todo item
  static Future<int> insertTodo(TaskModel task) async {
    final Database db = await DBHelper.db();
    final int id = await db.insert("Todo", task.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    return id;
  }

  //insert new user
  static Future<int> insertUser(int isVerified) async {
    final Database db = await DBHelper.db();

    final data = {"id": 0, "isVerified": isVerified};
    final int id = await db.insert("User", data,
        conflictAlgorithm: ConflictAlgorithm.replace);
    return id;
  }

  // get users
  static Future<List<Map<String, dynamic>>> getUsers() async {
    final Database db = await DBHelper.db();
    return db.query("User", orderBy: "id");
  }

  // get todos
  static Future<List<Map<String, dynamic>>> getTodos() async {
    final Database db = await DBHelper.db();
    return db.query("Todo", orderBy: "id");
  }

  // get a todo
  static Future<List<Map<String, dynamic>>> getTodo(int id) async {
    final Database db = await DBHelper.db();
    return db.query("Todo", where: "id=?", whereArgs: [id], limit: 1);
  }

  //update a todo
  static Future<int> updateTodo(int id, TaskModel updatedTask) async {
    final Database db = await DBHelper.db();
    final results = db.update(
      "Todo",
      updatedTask.toJson(),
      where: "id=?",
      whereArgs: [id],
    );
    return results;
  }

  //delete a todo
  static Future<void> deleteTodo(int id) async {
    final Database db = await DBHelper.db();
    try {
      await db.delete(
        "Todo",
        where: "id=?",
        whereArgs: [id],
      );
    } catch (err) {
      debugPrint("Error: $err");
    }
  }
}
