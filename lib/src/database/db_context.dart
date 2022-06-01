import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/services.dart';

class DBContext {
  static Database? _database;
  static final DBContext db = DBContext._();
  static final DBContext _instance = DBContext.internal(); // G
  factory DBContext() => _instance; // G
  static bool dbExists = false;
  DBContext._();
  DBContext.internal(); // G

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await initDB();

    return _database!;
  }

  // Método asíncrono para la creación de la BD y las tablas
  initDB() async {
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, "movie.db");
    var exists = await databaseExists(path);

    //Si no existe la bdd se hace una copia de assets
    if (!exists) {
      // Make sure the parent directory exists
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {}

      // Copy from asset
      ByteData data = await rootBundle.load(join("assets", "movie.db"));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      // Write and flush the bytes written
      await File(path).writeAsBytes(bytes, flush: true);
      print('Creamos en caso de que no exista: ' + path);
    }

    //Se crea la tabla Junta
    return await openDatabase(path, version: 1, onOpen: (db) {
      print(path);
    }, onCreate: (Database db, int version) async {
      if (!exists) {
        //Se crean las tablas
        // initScript.forEach((script) async => await db.execute(script));
        //Se importan los datos de los Temp a las tablas reales
        //importScript.forEach((script) async => await db.execute(script));
        //print('Tablas creadas');
      }
    });
  }

  executeRawQuery(String rawQuery) async {
    final db = await database;
    final res = db.execute(rawQuery);

    return res;
  }

  Future<List<Map<String, dynamic>>> executeQuery(String rawQuery) async {
    final db = await database;
    final res = db.rawQuery(rawQuery);

    return res;
  }

  closeDB() async {
    _database?.close();
    _database = null;
  }
}
