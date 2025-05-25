import 'package:symphony_1/model/wisata.dart';
import 'package:symphony_1/database/db_helper.dart';

Future<void> insertDummyData() async {
  List<Wisata> dummyWisata = [
    Wisata(
      id: 1,
      judul: 'Kalimas Boat Tour',
      deskripsi: 'Explore the beauty of Kalimas with a boat tour.',
      jamBuka: '09:00 - 17:00',
      hariBuka: 'Everyday',
      gambar: 'https://source.unsplash.com/random/300x300/?beach ',
    ),
    Wisata(
      id: 2,
      judul: 'Surabaya North Quay',
      deskripsi: 'Enjoy the night life at Surabaya North Quay.',
      jamBuka: '18:00 - 23:00',
      hariBuka: 'Everyday',
      gambar: 'https://source.unsplash.com/random/300x300/?city ',
    ),
    Wisata(
      id: 3,
      judul: 'Mangrove Forest',
      deskripsi: 'Discover the beauty of Mangrove Forest.',
      jamBuka: '08:00 - 16:00',
      hariBuka: 'Everyday',
      gambar: 'https://source.unsplash.com/random/300x300/?forest ',
    ),
    Wisata(
      id: 4,
      judul: 'Modern House',
      deskripsi: 'Visit the modern architecture house.',
      jamBuka: '10:00 - 18:00',
      hariBuka: 'Everyday',
      gambar: 'https://source.unsplash.com/random/300x300/?house ',
    ),
  ];

  DatabaseHelper dbHelper = DatabaseHelper();
  for (var wisata in dummyWisata) {
    await dbHelper.insertWisata(wisata.toMap());
  }
}