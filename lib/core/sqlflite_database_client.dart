import 'package:login_sample/core/base_database.dart';
import 'package:sqflite/sqflite.dart';

class SqlfliteDatabaseClient implements BaseDatabase {
  Database? _database;


  SqlfliteDatabaseClient._();

  static Future<BaseDatabase> create() async {
    final dbClient = SqlfliteDatabaseClient._();
    await dbClient.init();
    return dbClient;
  }

  @override
  Future<void> init() async {
    if (_database != null) {
      return;
    }
    _database = await openDatabase('my_db.db', version: 1, onCreate: (Database db, int version) async {
      await db.execute('''CREATE TABLE login (
        email TEXT PRIMARY KEY,
        password TEXT,
        login_count INTEGER)''');
    });
  }


  @override
  Future<void> close() {
    if (_database != null) {
      _database!.close();
    }
    return Future.value();
  }

  @override
  Future<List<Map<String, dynamic>>?> retrieve({
    required String table,
    String? id,
  }) async {
    if (id == null || id.isEmpty) {
      return await _database?.query(table);
    }
    final result = await _database?.query(table, where: 'email = ?', whereArgs: [id]);
    return result;
  }

  @override
  Future<void> upsert({
    required String table,
    required Map<String, dynamic> data,
    String? id,
  }) async {
    final exists = await retrieve(table: table, id: id ?? '');
    if (exists?.isEmpty == true || exists == null) {
      await _database?.insert(table, data);
    } else {
      final result = await _database?.update(table, data, where: 'email = ?', whereArgs: [id]);
      print(data);
    }
  }
}
