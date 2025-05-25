import 'package:flutter/material.dart';
import 'auth/login.dart'; // Sesuaikan path sesuai struktur proyekmu
import 'database/db_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Penting untuk async di main

  final dbHelper = DatabaseHelper();
  await dbHelper.database; // Menunggu database siap

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Login',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginPage(), // <-- Ini adalah halaman awal
      debugShowCheckedModeBanner: false,
    );
  }
}