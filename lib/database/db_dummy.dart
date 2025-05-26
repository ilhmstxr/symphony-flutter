import 'package:sqflite/sqflite.dart';

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
      'gambar': 'assets/image/surabayaBoat.jpg',
      'jenis_wisata': 'tempat',
      'kategori': 'destination',
      'alamat': 'Jalan Kalimas Raya, Surabaya',
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
      'gambar': 'assets/image/surabayaNorthQuay.jpg',
      'jenis_wisata': 
      'tempat',
      'kategori': 'port',
      'alamat': 'Jalan Perak Timur, Surabaya',
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
      'gambar': 'assets/image/mangrove.jpg',
      'jenis_wisata': 'tempat',
      'kategori': 'forest',
      'alamat': 'Kenjeran, Surabaya',
    },
  );

  await db.insert(
    'wisata',
    {
      'id': 4,
      'judul': 'Alun alun Surabaya',
      'deskripsi': 'Visit the modern architecture house.',
      'jam_buka': '10:00 - 18:00',
      'hari_buka': 'Everyday',
      'gambar': 'assets/image/alunAlun.jpg',
      'jenis_wisata': 'tempat',
      'kategori': 'destination',
      'alamat': 'Rungkut, Surabaya',
    },
  );

  await db.insert(
    'wisata',
    {
      'id': 5,
      'judul': 'Warung Soto Pak Mamat',
      'deskripsi': 'Soto lezat dengan bumbu khas Surabaya.',
      'jam_buka': '07:00 - 14:00',
      'hari_buka': 'Everyday',
      'gambar': 'assets/image/sotoBetawi.jpg',
      'jenis_wisata': 'kuliner',
      'kategori': 'kuliner',
      'alamat': 'Jalan Kupang Jaya, Surabaya',
    },
  );

  await db.insert(
    'wisata',
    {
      'id': 6,
      'judul': 'Bakso Kaki Lima',
      'deskripsi': 'Bakso enak dan murah dari kaki lima terkenal.',
      'jam_buka': '15:00 - 22:00',
      'hari_buka': 'Everyday',
      'gambar': 'assets/image/bakso.jpg',
      'jenis_wisata': 'kuliner',
      'kategori': 'kuliner',
      'alamat': 'Pasar Atom, Surabaya',
    },
  );

  await db.insert(
    'wisata',
    {
      'id': 7,
      'judul': 'Nasi Uduk Mbok Berek',
      'deskripsi': 'Nasi uduk dengan lauk lengkap dan harga terjangkau.',
      'jam_buka': '08:00 - 19:00',
      'hari_buka': 'Everyday',
      'gambar': 'assets/image/nasiUduk.jpg',
      'jenis_wisata': 'kuliner',
      'kategori': 'kuliner',
      'alamat': 'Jalan Embong Ploso, Surabaya',
    },
  );

  await db.insert(
    'wisata',
    {
      'id': 8,
      'judul': 'Es Teh Manis Mang Oki',
      'deskripsi': 'Minuman segar es teh manis yang legendaris.',
      'jam_buka': '09:00 - 21:00',
      'hari_buka': 'Everyday',
      'gambar': 'assets/image/esTeh.jpg',
      'jenis_wisata': 'kuliner',
      'kategori': 'kuliner',
      'alamat': 'Jalan HR Muhammad, Surabaya',
    },
  );

  print("Dummy data inserted successfully");
}