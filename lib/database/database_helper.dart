import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:unit_converter_app/modules/history_model.dart';


class DatabaseHelper {
  static const String dbName = 'history.db';
  static const String tableName = 'history';
  static Database? _database;

  DatabaseHelper._private();

  static final DatabaseHelper instance = DatabaseHelper._private();

  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    }
    _database = await createDatabase();
    return _database;
  }

  static createDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, dbName);
    return openDatabase(path, onCreate: (db, version) async {
      return await db.execute('''
              CREATE TABLE $tableName(
              id INTEGER PRIMARY KEY,
              unit_name TEXT NOT NULL,
             result TEXT NOT NULL,
             date Text NOT NULL
             )
             ''');
    }, version: 1);
  }

  Future<void> insert({required HistoryModel historyModel}) async{
    final Database? db = await DatabaseHelper.instance.database;
    db?.insert(tableName, historyModel.toMap());
  }

  Future<List<HistoryModel>> getData() async {
    final db = await DatabaseHelper.instance.database;
    final List<Map<String, Object?>> data = await db?.query(tableName) ?? [];
    return data.map((e) => HistoryModel.fromMap(e)).toList();
  }

  Future<void> update({required HistoryModel historyModel,required int id}) async {
    final Database? db = await DatabaseHelper.instance.database;
    await db?.update(tableName, historyModel.toMap(),
        where: "id = ?", whereArgs: [id]);
  }

  Future<void> delete(int? id) async {
    final Database? db = await DatabaseHelper.instance.database;
    await db?.delete(tableName,
        where: "id = ?", whereArgs: [id]);
  }
}
