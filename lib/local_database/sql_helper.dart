import 'package:sqflite/sqflite.dart' as sql;

class SqlHelper {
  //creating tables
  static Future<void> createTable(sql.Database database) async {
    await database.execute("""CREATE TABLE items(
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    title TEXT,
    description TEXT,
    createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
    )""");
  }

//opening database
  static Future<sql.Database> db() async {
    // print("creating database...");
    return sql.openDatabase('dbtech.db', version: 1,
        onCreate: (sql.Database database, int version) async {
      // print("Creating Tables");
      await createTable(database);
    });
  }

//creating items
  static Future<int> createItem(String title, String? description) async {
    final db = await SqlHelper.db();
    final data = {'title': title, 'description': description};

    final id = await db.insert('items', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);

    return id;
  }

//getting items at first

  static Future<List<Map<String, dynamic>>> getItems() async {
    final db = await SqlHelper.db();
    return db.query('items', orderBy: 'id');
  }

//get item by id

  static Future<List<Map<String, dynamic>>> getItem(int id) async {
    final db = await SqlHelper.db();
    return db.query('items', where: 'id = ?', whereArgs: [id], limit: 1);
  }

//update items

  static Future<int> updateItem(
      int id, String title, String? description) async {
    final db = await SqlHelper.db();

    Map<String, dynamic> data = {
      'title': title,
      'description': description,
      'createdAt': DateTime.now().toString()
    };

    final result =
        await db.update('items', data, where: 'id=?', whereArgs: [id]);
    return result;
  }

  //delete item

  static Future<void> deleteItem(int id) async {
    final db = await SqlHelper.db();
    try {
      db.delete('items', where: 'id=?', whereArgs: [id]);
    } catch (err) {
      print(err);
    }
  }
}
