import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../common/image_converters.dart';
import '../data/person.dart';

// database table and column names
const String tablePeople = 'people';
const String columnId = '_id';
const String columnFullName = 'full_name';
const String columnImage = 'image';
const String columnEmail = 'email';
const String columnAddress = 'address';
const String columnPhone = 'phone';

// data model class
class PersonDB {
  int? id;
  String? fullName;
  String? image, email, address, phone;

  PersonDB.fromJSON(Person person) {
    fullName = person.name?.fullName ?? '';
    image = person.picture?.large ?? '';
    email = person.email ?? '';
    address = person.location?.fullLocation ?? '';
    phone = person.phone ?? '';
  }

  PersonDB.fromMap(Map<dynamic, dynamic> map) {
    id = map[columnId];
    fullName = map[columnFullName];
    image = map[columnImage];
    email = map[columnEmail];
    address = map[columnAddress];
    phone = map[columnPhone];
  }

  // convenience method to create a Map from this User object
  Future<Map<String, dynamic>> toMap() async {
    String base64 = await ImageConverter.instance
        .imageToBase64(image ?? 'assets/images/logo.png');
    var map = <String, dynamic>{
      columnFullName: fullName,
      columnImage: base64,
      columnEmail: email,
      columnAddress: address,
      columnPhone: phone,
    };
    if (id != null) {
      map[columnId] = id;
    }
    return map;
  }
}

class DatabaseHelper {
  // This is the actual database filename that is saved in the docs directory.
  static const _databaseName = 'TinderDatabase2.db';

  // Increment this version when you need to change the schema.
  static const _databaseVersion = 2;

  // Make this a singleton class.
  DatabaseHelper._privateConstructor();

  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // Only allow a single open connection to the database.
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  // open the database
  _initDatabase() async {
    // The path_provider plugin gets the right directory for Android or iOS.
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    // Open the database. Can also add an onUpdate callback parameter.
    return await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _onCreate,
    );
  }

  // SQL string to create the database
  Future _onCreate(Database db, int version) async {
    await db.execute('''
              CREATE TABLE $tablePeople (
                $columnId INTEGER PRIMARY KEY,
                $columnFullName TEXT NOT NULL,
                $columnImage TEXT NOT NULL,
                $columnEmail TEXT NOT NULL,
                $columnAddress TEXT NOT NULL,
                $columnPhone TEXT NOT NULL
              )
              ''');
  }

  // Database helper methods:

  Future<int> insert(PersonDB user) async {
    Database db = await database;
    Map<String, dynamic> maps = await user.toMap();
    int id = await db.insert(tablePeople, maps);
    return id;
  }

  Future<PersonDB?> queryUserByID(int id) async {
    Database db = await database;
    List<Map> maps = await db.query(tablePeople,
        columns: [
          columnId,
          columnFullName,
          columnImage,
          columnEmail,
          columnAddress,
          columnPhone,
        ],
        where: '$columnId = ?',
        whereArgs: [id]);
    if (maps.isNotEmpty) {
      return PersonDB.fromMap(maps.first);
    }
    return null;
  }

  // queryAllUsers()
  Future<List<PersonDB>> queryUser() async {
    Database db = await database;
    List<Map> maps = await db.query(tablePeople, columns: [
      columnId,
      columnFullName,
      columnImage,
      columnEmail,
      columnAddress,
      columnPhone,
    ]);
    var people = <PersonDB>[];
    for (var map in maps) {
      people.add(PersonDB.fromMap(map));
    }
    return people;
  }

  Future<List<PersonDB>> read() async {
    DatabaseHelper helper = DatabaseHelper.instance;
    List<PersonDB> users = await helper.queryUser();
    return users;
  }

  save(Person person) async {
    DatabaseHelper helper = DatabaseHelper.instance;
    await helper.insert(PersonDB.fromJSON(person));
  }
}
