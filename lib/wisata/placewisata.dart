import 'package:flutter/material.dart';
import 'package:symphony_1/model/wisata.dart'; // Model Wisata
import 'package:symphony_1/utils/header.dart'; // Header.dart
import 'package:symphony_1/utils/cardFull.dart';
import 'package:symphony_1/wisata/detailwisata.dart'; // PlaceCard.dart

class PlaceWisata extends StatefulWidget {
  final String title;
  final List<Wisata> wisata;

  const PlaceWisata({Key? key, required this.title, required this.wisata})
      : super(key: key);

  @override
  State<PlaceWisata> createState() => _PlaceWisataState();
}

class _PlaceWisataState extends State<PlaceWisata> {
  late List<Wisata> filteredWisata;

  @override
  void initState() {
    super.initState();
    filteredWisata = widget.wisata;
  }

  void _runFilter(String enteredKeyword) {
    List<Wisata> results = [];
    if (enteredKeyword.isEmpty) {
      results = widget.wisata;
    } else {
      results = widget.wisata
          .where((wisata) =>
              wisata.judul.toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    setState(() {
      filteredWisata = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Header(title: widget.title, onSearchChanged: _runFilter),
          const SizedBox(height: 20),
          ...groupWisataByCategory(filteredWisata).entries.map((entry) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  entry.key,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                ...entry.value.map((wisataItem) {
                  return InkWell(
                    onTap: () {
                      // Navigasi ke halaman detail
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DetailWisata(wisata: wisataItem),
                        ),
                      );
                    },
                    child: PlaceCard(wisata: wisataItem),
                  );
                }),
              ],
            );
          }),
        ],
      ),
    );
  }

  Map<String, List<Wisata>> groupWisataByCategory(List<Wisata> wisataList) {
    return wisataList.fold<Map<String, List<Wisata>>>(
      {},
      (Map<String, List<Wisata>> map, Wisata item) {
        map.putIfAbsent(item.kategori, () => []).add(item);
        return map;
      },
    );
  }
}
