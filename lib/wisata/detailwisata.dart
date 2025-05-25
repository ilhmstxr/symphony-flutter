// detail_wisata.dart

import 'package:flutter/material.dart';
import 'package:symphony_1/model/wisata.dart';

class DetailWisata extends StatelessWidget {
  final Wisata wisata;

  const DetailWisata({Key? key, required this.wisata}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(wisata.judul),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                wisata.gambar,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              wisata.judul,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text('Kategori: ${wisata.kategori}'),
            const SizedBox(height: 8),
            Text('Alamat: ${wisata.alamat}'),
            const SizedBox(height: 16),
            Text(
              'Deskripsi tempat wisata ${wisata.judul}. Lorem ipsum dolor sit amet...',
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}