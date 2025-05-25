import 'package:flutter/material.dart';
import 'package:symphony_1/database/db_helper.dart';
import 'package:symphony_1/utils/dialog_helper.dart';

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

  bool _passwordVisible = false;
  bool _repasswordVisible = false;

  @override
  void initState() {
    super.initState();
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
    print("preesed");
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();
    String rePassword = _rePasswordController.text.trim();
    String birthday = _birthdayController.text.trim();

    if (email.isNotEmpty &&
        password.isNotEmpty &&
        rePassword.isNotEmpty &&
        birthday.isNotEmpty) {
      if (password == rePassword) {
        try {
          bool emailExists = await dbHelper.isEmailExists(email);
          if (emailExists) {
            DialogHelper.errorDialog(context, 'Email already exists');
            return;
          }
          Map<String, dynamic> user = {
            'email': email,
            'password': password,
            'tanggal_lahir': birthday
          };

          DialogHelper.successDialog(context, 'Registration successful');

          await dbHelper.insertUser(user);
          // Kosongkan semua textfield
          _emailController.clear();
          _passwordController.clear();
          _rePasswordController.clear();
          _birthdayController.clear();

        } catch (e) {
          DialogHelper.errorDialog(context, 'Registration failed');
        }
      } else {
        DialogHelper.errorDialog(
            context, 'Password and re-password do not match');
      }
    } else {
      DialogHelper.errorDialog(context, 'Please fill in all fields');
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
                    Navigator.of(context)
                        .pop(); // Kembali ke halaman sebelumnya
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
                  Stack(
                    alignment: Alignment.centerRight,
                    children: [
                      TextField(
                        controller: _passwordController,
                        obscureText: !_passwordVisible,
                        decoration: InputDecoration(
                          hintText: "********",
                          hintStyle: const TextStyle(fontSize: 12),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                          ),
                        ),
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          _passwordVisible
                              ? Icons.visibility_off
                              : Icons.visibility,
                          size: 20,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          setState(() {
                            _passwordVisible = !_passwordVisible;
                          });
                        },
                      ),
                    ],
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
                  Stack(
                    alignment: Alignment.centerRight,
                    children: [
                      TextField(
                        controller: _rePasswordController,
                        obscureText: !_repasswordVisible,
                        decoration: InputDecoration(
                          hintText: "********",
                          hintStyle: const TextStyle(fontSize: 12),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                          ),
                        ),
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          _repasswordVisible
                              ? Icons.visibility_off
                              : Icons.visibility,
                          size: 20,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          setState(() {
                            _repasswordVisible = !_repasswordVisible;
                          });
                        },
                      ),
                    ],
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
