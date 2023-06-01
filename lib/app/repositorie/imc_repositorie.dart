import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:imc_dio/app/models/imc_model.dart';

class ImcRepository {
  Future<Database> _getDatabase() async {
    final String path = join(await getDatabasesPath(), 'imc_database.db');
    return openDatabase(
      path,
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE imc(id INTEGER PRIMARY KEY, height TEXT, weight TEXT)',
        );
      },
      version: 1,
    );
  }

  Future<void> save(ImcSQLiteModel imcModel) async {
    final Database db = await _getDatabase();
    await db.insert(
      'imc',
      imcModel.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<ImcSQLiteModel>> getAll() async {
    final Database db = await _getDatabase();
    final List<Map<String, dynamic>> maps = await db.query('imc');
    return List.generate(maps.length, (i) {
      return ImcSQLiteModel(
        id: maps[i]['id'],
        height: maps[i]['height'],
        weight: maps[i]['weight'],
      );
    });
  }
}
