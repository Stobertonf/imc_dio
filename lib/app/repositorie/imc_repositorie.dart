import 'package:sqflite/sqflite.dart';
import 'package:imc_dio/app/models/imc_model.dart';
import 'package:imc_dio/app/database/sqlitedatabase.dart';

class ImcSQLiteRepository {
  final SQLiteDataBase _database = SQLiteDataBase();

  Future<List<ImcSQLiteModel>> getAll() async {
    final Database db = await _database.getDataBase();
    final List<Map<String, dynamic>> maps = await db.query('imc');
    return List.generate(maps.length, (i) {
      return ImcSQLiteModel(
        id: maps[i]['id'],
        height: maps[i]['height'],
        weight: maps[i]['weight'],
      );
    });
  }

  Future<void> save(ImcSQLiteModel imc) async {
    final Database db = await _database.getDataBase();
    await db.insert(
      'imc',
      imc.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> delete(int id) async {
    final Database db = await _database.getDataBase();
    await db.delete(
      'imc',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
