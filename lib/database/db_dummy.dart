import 'package:sqflite/sqflite.dart';
import 'package:symphony_1/database/db_helper.dart';

// Fungsi untuk menambahkan data dummy saat aplikasi dijalankan
Future<void> insertDummyData(Database db) async {
  // Dummy Users
  await db.insert(
    'users',
    {
      'email': 'user1@example.com',
      'password': 'password123', // Harusnya hash password di produksi
    },
  );

  await db.insert(
    'users',
    {
      'email': 'admin@example.com',
      'password': 'adminpass',
    },
  );

  // Dummy Wisata - tambahan baru
  await db.insert(
    'wisata',
    {
      'id': 1,
      'judul': 'Kalimas Boat Tour',
      'deskripsi': 'Explore the beauty of Kalimas with a boat tour.',
      'jam_buka': '09:00 - 17:00',
      'hari_buka': 'Everyday',
      'gambar': 'https://source.unsplash.com/random/300x300/?beach ',
    },
  );

  await db.insert(
    'wisata',
    {
      'id': 2,
      'judul': 'Surabaya North Quay',
      'deskripsi': 'Enjoy the night life at Surabaya North Quay.',
      'jam_buka': '18:00 - 23:00',
      'hari_buka': 'Everyday',
      'gambar': 'https://source.unsplash.com/random/300x300/?city ',
    },
  );

  await db.insert(
    'wisata',
    {
      'id': 3,
      'judul': 'Mangrove Forest',
      'deskripsi': 'Discover the beauty of Mangrove Forest.',
      'jam_buka': '08:00 - 16:00',
      'hari_buka': 'Everyday',
      'gambar': 'https://source.unsplash.com/random/300x300/?forest ',
    },
  );

  await db.insert(
    'wisata',
    {
      'id': 4,
      'judul': 'Modern House',
      'deskripsi': 'Visit the modern architecture house.',
      'jam_buka': '10:00 - 18:00',
      'hari_buka': 'Everyday',
      'gambar': 'https://source.unsplash.com/random/300x300/?house ',
    },
  );

  print("Dummy data inserted successfully");
}