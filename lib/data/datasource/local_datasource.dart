import 'package:noted_app/model/data_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class LocalDataSource {
  final String dbName = "notes_local01.db";
  final String tableName = "notes";

  Future<Database> _openDataBase() async {
    final dataBasePath = await getDatabasesPath();
    final path = join(dataBasePath, dbName);

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute(
          '''CREATE TABLE $tableName(id INTEGER PRIMARY KEY AUTOINCREMENT,
          title TEXT,
          body TEXT,
          color TEXT,
          creatAdd TEXT)''',
        );
      },
    );
  }

  Future<int> insertNote(DataModel note) async {
    final db = await _openDataBase();
    return await db.insert(tableName, note.toMap());
  }

  //getall
  Future<List<DataModel>> getAllNotes() async {
    final db = await _openDataBase();
    final maps = await db.query(tableName, orderBy: 'creatAdd DESC');
    return List.generate(maps.length, (index) {
      return DataModel.fromMap(maps[index]);
    });
  }

  //get note by id
  Future<DataModel> getNoteById(int id) async {
    final db = await _openDataBase();
    final maps = await db.query(
      tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
    return DataModel.fromMap(maps.first);
  }

  //update
  Future<int> updateNote(DataModel note) async {
    final db = await _openDataBase();
    return await db.update(
      tableName,
      note.toMap(),
      where: 'id = ?',
      whereArgs: [note.id],
    );
  }

  //delete
  Future<int> deleteNote(int id) async {
    final db = await _openDataBase();
    return await db.delete(
      tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
