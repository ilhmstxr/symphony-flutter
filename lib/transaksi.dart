// transaksi.dart

import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class Transaksi extends StatelessWidget {
  final String namaPengguna;
  final String emailPengguna;
  final int totalPembayaran;
  final String paymentCode;

  const Transaksi({
    Key? key,
    required this.namaPengguna,
    required this.emailPengguna,
    required this.totalPembayaran,
    required this.paymentCode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Payment Ticket"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Informasi Pengguna
            Text(
              namaPengguna,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(emailPengguna),

            SizedBox(height: 16),

            // Total Pembayaran
            Text(
              "Rp${totalPembayaran.toString()}",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 16),

            // Status Transaksi
            Row(
              children: [
                Chip(label: Text("Order")),
                Icon(Icons.arrow_forward),
                Chip(label: Text("Buy")),
                Icon(Icons.arrow_forward),
                Chip(label: Text("E-Ticket")),
              ],
            ),

            SizedBox(height: 16),

            // Barcode QR Code
            Center(
              child: Column(
                children: [
                  Text("Barcode Qris"),
                  SizedBox(height: 8),
                  QrImageView(
                    data: paymentCode, // Misal: "P245178XC56"
                    version: QrVersions.auto,
                    size: 200.0,
                    gapless: true,
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.white,
                  ),
                  SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: () {
                      // Logika download QR code bisa ditambahkan di sini
                    },
                    child: Text("Download"),
                  ),
                ],
              ),
            ),

            SizedBox(height: 16),

            // Waktu Sisa Pembayaran
            Text("Complete payment in:"),
            SizedBox(height: 8),
            Text(
              "59:29:00",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 16),

            // Tombol Cancel Payment
            ElevatedButton(
              onPressed: () {},
              child: Text("Cancel Payment"),
            ),
          ],
        ),
      ),
    );
  }
}
