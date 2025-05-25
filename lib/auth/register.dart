import 'package:flutter/material.dart';
import 'package:symphony_1/database/db_helper.dart';
import 'package:symphony_1/database/db_dummy.dart'; // Impor file db_dummy.dart

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _rePasswordController = TextEditingController();
  final _birthdayController = TextEditingController();

  final DatabaseHelper dbHelper = DatabaseHelper();

  @override
  void initState() {
    super.initState();
    _initializeDatabase();
  }

  void _initializeDatabase() async {
    await dbHelper.database; // Hapus tanda kurung ()
    // Tambahkan data dummy jika diperlukan
    await insertDummyData();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _rePasswordController.dispose();
    _birthdayController.dispose();
    super.dispose();
  }

  void _registerUser() async {
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();
    String rePassword = _rePasswordController.text.trim();
    String birthday = _birthdayController.text.trim();

    if (email.isNotEmpty &&
        password.isNotEmpty &&
        rePassword.isNotEmpty &&
        birthday.isNotEmpty) {
      if (password == rePassword) {
        Map<String, dynamic> user = {
          'email': email,
          'password': password,
        };

        try {
          await dbHelper.insertUser(user);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Registration successful')),
          );
          Navigator.pop(context); // Kembali ke halaman login
        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Registration failed: $e')),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Passwords do not match')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill in all fields')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Back Button
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.of(context).pop(); // Kembali ke halaman sebelumnya
                  },
                ),
              ),
              const SizedBox(height: 20),
              // Logo
              Image.asset(
                'assets/image/symphony.png', // Pastikan gambar tersedia
                width: 150,
                height: 150,
              ),
              const SizedBox(height: 30),
              // Email Field
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "E-mail/username",
                    style: TextStyle(fontSize: 10, color: Colors.black),
                  ),
                  const SizedBox(height: 4),
                  TextField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: "JohnDoe@gmail.com",
                      hintStyle: const TextStyle(fontSize: 10),
                      border: OutlineInputBorder(),
                    ),
                    style: const TextStyle(fontSize: 10, color: Colors.black),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              // Password Field
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Password",
                    style: TextStyle(fontSize: 10, color: Colors.black),
                  ),
                  const SizedBox(height: 4),
                  TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "********",
                      hintStyle: const TextStyle(fontSize: 10),
                      border: OutlineInputBorder(),
                    ),
                    style: const TextStyle(fontSize: 10, color: Colors.black),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              // Re-enter Password Field
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Re-Enter Password",
                    style: TextStyle(fontSize: 10, color: Colors.black),
                  ),
                  const SizedBox(height: 4),
                  TextField(
                    controller: _rePasswordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "********",
                      hintStyle: const TextStyle(fontSize: 10),
                      border: OutlineInputBorder(),
                    ),
                    style: const TextStyle(fontSize: 10, color: Colors.black),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              // Birthday Field (Date input)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Birthday",
                    style: TextStyle(fontSize: 10, color: Colors.black),
                  ),
                  const SizedBox(height: 4),
                  TextField(
                    controller: _birthdayController,
                    decoration: InputDecoration(
                      hintText: "DD/MM/YYYY",
                      hintStyle: const TextStyle(fontSize: 10),
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.datetime,
                    style: const TextStyle(fontSize: 10, color: Colors.black),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              // Create Account Button
              ElevatedButton(
                onPressed: _registerUser,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0A285F), // Navy color
                  minimumSize: const Size(288, 63),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text("Create Account"),
              ),
              const Spacer(), // Untuk push footer ke bawah
              // Footer Text
              const Align(
                alignment: Alignment.center,
                child: Text(
                  "2024 Jelajah Surabaya, All rights reserved",
                  style: TextStyle(fontSize: 12, color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}