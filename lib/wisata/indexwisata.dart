import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:symphony_1/database/db_helper.dart';
import 'package:symphony_1/database/db_dummy.dart';
import 'package:symphony_1/model/wisata.dart';

class IndexWisata extends StatefulWidget {
  @override
  IndexWisataState createState() => IndexWisataState();
}

class IndexWisataState extends State<IndexWisata> {
  late DatabaseHelper dbHelper;
  List<Wisata> wisataList = [];
  List<Wisata> filteredWisataList = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    dbHelper = DatabaseHelper();

    dbHelper.database.then((value) async {
      List<Map<String, dynamic>> maps = await dbHelper.getAllWisata();
      if (maps.isEmpty) {
        await insertDummyData(); // Masukkan data dummy jika belum ada data
      }
      _loadWisata();
    });
    searchController.addListener(_onSearchChanged);
  }

  void _loadWisata() async {
    List<Map<String, dynamic>> maps = await dbHelper.getAllWisata();
    setState(() {
      wisataList = List.generate(maps.length, (i) {
        return Wisata.fromMap(maps[i]);
      });
    });
  }

  void _onSearchChanged() {
    String query = searchController.text;
    if (query.isEmpty) {
      _loadWisata();
    } else {
      _searchWisata(query);
    }
  }

  void _searchWisata(String query) async {
    List<Map<String, dynamic>> maps = await dbHelper.searchWisata(query);
    setState(() {
      wisataList = List.generate(maps.length, (i) {
        return Wisata.fromMap(maps[i]);
      });
    });
  }

  @override
  void dispose() {
    searchController.removeListener(_onSearchChanged);
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('9:41', style: TextStyle(color: Colors.black)),
                SizedBox(height: 8),
                Text(
                  'Hello, Sarah',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(
                'https://source.unsplash.com/random/300x300/?profile ',
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search Bar
              TextField(
                controller: searchController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Search a Place Here...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 16),

              // Question Section
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: Color(0xFF4A90E2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        'Where do you want to go today?',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Icon(Icons.location_on, color: Colors.white, size: 48),
                  ],
                ),
              ),
              SizedBox(height: 16),

              // Category Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF4A90E2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Text('Place'),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF4A90E2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Text('Culinary'),
                  ),
                ],
              ),
              SizedBox(height: 16),

              // Recommendations
              Text(
                'Recommendation',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),

              // Grid View for Recommendations
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: wisataList.length,
                itemBuilder: (context, index) {
                  return RecommendationCard(wisata: wisataList[index]);
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: Color(0xFF4A90E2),
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

// Custom Widget for Recommendation Card
class RecommendationCard extends StatelessWidget {
  final Wisata wisata;

  RecommendationCard({required this.wisata});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
            wisata.gambar,
            height: 150,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: 8),
        Text(wisata.judul, style: TextStyle(fontWeight: FontWeight.bold)),
      ],
    );
  }
}
