// detail_wisata.dart

import 'package:flutter/material.dart';
import 'package:symphony_1/model/wisata.dart';
import 'package:symphony_1/transaksi.dart';

class DetailWisata extends StatelessWidget {
  final Wisata wisata;

  const DetailWisata({Key? key, required this.wisata}) : super(key: key);
  void checkout(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Transaksi(
          namaPengguna: "Sarah Venny",
          emailPengguna: "sarahvennya@gmail.com",
          totalPembayaran: 30000,
          paymentCode: "P245178XC56",
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(wisata.judul),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gambar Utama
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                wisata.gambar,
                height: 250,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 16),

            // Informasi Wisata
            Container(
              decoration: BoxDecoration(
                color: Colors.blue.shade300,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            wisata.judul,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            wisata.alamat,
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.share, color: Colors.white),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: Icon(Icons.favorite_border,
                                color: Colors.white),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      for (int i = 1; i <= 5; i++)
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                      SizedBox(width: 8),
                      Text(
                        "4.5",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 16),

            // Tiket dan Tombol Beli
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue.shade300,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    // child: Text("Ticket Price Rp ${wisata.jamBuka}"),
                    child: Text("Ticket Price Rp 10.000"),
                  ),
                ),
                SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () => checkout(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade300,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text("Buy Now"),
                ),
              ],
            ),

            SizedBox(height: 16),

            // Deskripsi
            Card(
              margin: EdgeInsets.zero,
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "About",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      wisata.deskripsi,
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
