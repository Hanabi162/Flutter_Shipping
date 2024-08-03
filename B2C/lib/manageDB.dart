import 'model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class manageDB {
  static Database? _database;

  Future<Database> initializedb() async {
    if (_database == null) _database = await createdb();
    return _database!;
  }

  Future<Database> createdb() async {
    final path = await getDatabasesPath();

    var database = await openDatabase(
      join(path, 'userDatabase.db'),
      version: 1,
      onCreate: ((db, version) async {
        await db.execute(
          '''CREATE TABLE user(
        id                    INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, 
        NameAndSurname        TEXT, 
        PhoneNumber           TEXT,
        Email                 TEXT,
        selectedContainerType TEXT,
        weight                INTEGER,
        selectedDestination   TEXT,
        distance              INTEGER,
        basePriceByWeight     INTEGER,
        priceByDistance       INTEGER,
        totalPrice            INTEGER
          )''',
        );
      }),
    );
    return database;
  }

  Future insertData(userDB model) async {
    var db = await initializedb();
    var result = await db.insert('user', model.toMap());
    return result;
  }

  //--------- ฟังก์ชันสำหรับดึงข้อมูลจากฐานข้อมูลทั้งหมด ---------
  Future<List<userDB>> getAllData() async {
    var db = await initializedb();
    List<Map<String, dynamic>> result = await db.query('user');
    return List.generate(
      result.length,
      (index) => userDB(
          id: result[index]['id'],
          NameAndSurname: result[index]['NameAndSurname'],
          Email: result[index]['Email'],
          PhoneNumber: result[index]['PhoneNumber'],
          selectedContainerType: result[index]['selectedContainerType'],
          weight: result[index]['weight'],
          selectedDestination: result[index]['selectedDestination'],
          distance: result[index]['distance'],
          basePriceByWeight: result[index]['basePriceByWeight'],
          priceByDistance: result[index]['priceByDistance'],
          totalPrice: result[index]['totalPrice']),
    );
  }

  //--------- ฟังก์ชันสำหรับแก้ไข/อัพเดทข้อมูลในฐานข้อมูล ---------
  Future<int> updateData(userDB model) async {
  var db = await initializedb();
  var result = await db.update(
    'user',
    {
      'PhoneNumber': model.PhoneNumber,
      'Email': model.Email,
    },
    where: 'id=?',
    whereArgs: [model.id],
  );
  return result;
}


  //--------- ฟังก์ชันสำหรับลบข้อมูลตาม id ที่ระบุใน whereArgs ---------
  Future deleteData(userDB model) async {
    var db = await initializedb();
    var result = db.delete(
      'user',
      where: 'id=?',
      whereArgs: [model.id],
    );
    return result;
  }
}
