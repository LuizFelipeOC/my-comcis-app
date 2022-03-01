import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHandler {
  Future<Database> initializeDB() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, 'cart.db'),
      onCreate: (database, version) async {
        await database.execute(
          "CREATE TABLE CARTS(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT NOT NULL,price INTEGER NOT NULL, image TEXT NOT NULL, idcomics TEXT NOT NULL)",
        );
      },
      version: 1,
    );
  }
}
