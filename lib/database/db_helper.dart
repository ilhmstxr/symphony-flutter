import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:symphony_1/model/wisata.dart';
import 'package:symphony_1/model/user.dart';
import 'package:symphony_1/database/db_dummy.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  Database? _db; // Hapus 'late'

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_db != null) {
      return _db!;
    }
    _db = await _initDatabase();
    return _db!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'my_database.db');
    return await openDatabase(
      path,
      version: 2,
      onCreate: _onCreate,
    );
  }
Future<void> _onCreate(Database db, int version) async {
  // Tabel users dengan kolom tambahan: tanggal_lahir
  await db.execute('''
    CREATE TABLE users (
      id INTEGER PRIMARY KEY,
      email TEXT NOT NULL,
      password TEXT NOT NULL,
      tanggal_lahir TEXT
    )
  ''');

  // Tabel wisata dengan kolom tambahan: jenis_wisata
  await db.execute('''
    CREATE TABLE wisata (
      id INTEGER PRIMARY KEY,
      judul TEXT NOT NULL,
      deskripsi TEXT,
      jam_buka TEXT,
      hari_buka TEXT,
      gambar TEXT,
      jenis_wisata TEXT,
      kategori TEXT,
      alamat TEXT
    )
  ''');

  await insertDummyData(db);
}


  // Tambah user / registrasi
  Future<int> insertUser(Map<String, dynamic> row) async {
    try {
      Database db = await database;
      return await db.insert("users", row);
    } catch (e) {
      print("Error inserting user: $e");
      rethrow;
    }
  }

  // Tambah wisata
  Future<int> insertWisata(Map<String, dynamic> row) async {
    try {
      Database db = await database;
      return await db.insert("wisata", row);
    } catch (e) {
      print("Error inserting wisata: $e");
      rethrow;
    }
  }

  // Mengambil semua data user
  Future<List<Map<String, dynamic>>> getAllUsers() async {
    try {
      Database db = await database;
      return await db.query("users");
    } catch (e) {
      print("Error getting all users: $e");
      rethrow;
    }
  }

  // Mengambil semua data wisata
  Future<List<Map<String, dynamic>>> getAllWisata() async {
    try {
      Database db = await database;
      return await db.query("wisata");
    } catch (e) {
      print("Error getting all wisata: $e");
      rethrow;
    }
  }

  // Mengambil wisata by ID
  Future<Map<String, dynamic>?> getWisataById(int id) async {
    try {
      Database db = await database;
      List<Map<String, dynamic>> result = await db.query(
        "wisata",
        where: "id = ?",
        whereArgs: [id],
      );
      return result.isNotEmpty ? result.first : null;
    } catch (e) {
      print("Error getting wisata by ID: $e");
      rethrow;
    }
  }

  // Update wisata
  Future<int> updateWisata(int id, Map<String, dynamic> row) async {
    try {
      Database db = await database;
      return await db.update("wisata", row, where: "id = ?", whereArgs: [id]);
    } catch (e) {
      print("Error updating wisata: $e");
      rethrow;
    }
  }

  // Delete wisata
  Future<int> deleteWisata(int id) async {
    try {
      Database db = await database;
      return await db.delete("wisata", where: "id = ?", whereArgs: [id]);
    } catch (e) {
      print("Error deleting wisata: $e");
      rethrow;
    }
  }

  // Pencarian wisata berdasarkan judul
  Future<List<Map<String, dynamic>>> searchWisata(String query) async {
    try {
      Database db = await database;
      List<Map<String, dynamic>> result = await db.query(
        "wisata",
        where: "judul LIKE ?",
        whereArgs: ["%$query%"],
      );
      return result;
    } catch (e) {
      print("Error searching wisata: $e");
      rethrow;
    }
  }

  // Cek email user
  Future<Map<String, dynamic>?> getUserByEmail(String email) async {
    try {
      Database db = await database;
      List<Map<String, dynamic>> result = await db.query(
        "users",
        where: "email = ?",
        whereArgs: [email],
      );
      return result.isNotEmpty ? result.first : null;
    } catch (e) {
      print("Error getting user by email: $e");
      rethrow;
    }
  }

  // cek email 2
  // db_helper.dart

Future<bool> isEmailExists(String email) async {
  Database db = await database;
  List<Map<String, dynamic>> users = await db.query(
    'users',
    where: 'email = ?',
    whereArgs: [email],
  );
  return users.isNotEmpty;
}

  // Validasi user menggunakan email dan password
  Future<bool> validateUser(String email, String password) async {
    try {
      Database db = await database;
      List<Map<String, dynamic>> users = await db.query(
        'users',
        where: 'email = ? AND password = ?',
        whereArgs: [email, password],
      );
      return users.isNotEmpty;
    } catch (e) {
      print("Error validating user: $e");
      rethrow;
    }
  }
}
