import 'dart:io' as io;
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'user.dart';
class DBHelper{
  static Database _database;
  static const String ID = 'id';
  static const String USERNAME = 'username';
  static const String PASSWORD = 'password';
  static const String TABLE = 'User';
  static const String DB_NAME = 'database.db';

  DBHelper._privateConstructor();
  static final DBHelper instance = DBHelper._privateConstructor();

  Future<Database> get db async{
    if(_database != null){
      return _database;
    }
    _database = await initDB();
    return _database;
  }

  initDB() async{
    io.Directory documentsDirectory = (await getDatabasesPath()) as io.Directory;
    String path = join(documentsDirectory.path, DB_NAME);
    var db = await openDatabase(path, version:1, onCreate:_onCreate); 
    return db;
  }

  _onCreate(Database db, int version) async{
    await db.execute("CREATE TABLE $TABLE ($ID INTEGER PRIMARY KEY, $USERNAME TEXT, $PASSWORD TEXT");
     
  }
Future<User> save (User user)async{
  var dbClient = await db;
  user.id = await dbClient.insert(TABLE, user.toMap());
  return user;
  /*await dbClient.transaction((txn)async{
     var query = "INSERT INTO $TABLE ($USERNAME) VALUES ('"+user.username)";
  });
*/

}
  Future<List<User>> getUsers() async{
    var dbClient = await db;
    List<Map> maps = await dbClient.query(TABLE, columns:[ID, USERNAME, PASSWORD]);
    //List<Map> maps = await dbClient.rawQuery("SELECT * FROM $TABLE");
    List<User>user = [];
    if(maps.length>0){
      for (int i = 0; i < maps.length; i++){
        user.add(User.fromMap(maps[i]));
      }
    } 
    return user;
  }
  Future<int> delete (int id) async{
    var dbClient = await db;
    return await dbClient.delete(TABLE, where:'$ID = ?', whereArgs: [id]);
  }
  Future<int> update(User user) async{
    var dbClient = await db;
    return await dbClient.update(TABLE, user.toMap(),where:'$ID = ?',whereArgs: [user.id]);
  }
  Future close() async{
    var dbClient = await db;
    dbClient.close();
  }
}
