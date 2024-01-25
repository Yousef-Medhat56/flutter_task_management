import "package:sqflite/sqflite.dart";

class DBHelper {
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

  static Future<Database> db() async {
    return openDatabase(
      "task_managment",
      version: 1,
      onCreate: (Database database, int version) async {
        await createTables(database);
      },
    );
  }
}
