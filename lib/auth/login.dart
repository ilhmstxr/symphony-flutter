import 'package:flutter/material.dart';
import 'package:symphony_1/auth/register.dart';
import 'package:symphony_1/utils/dialog_helper.dart';
import 'package:symphony_1/database/db_helper.dart';
import 'package:symphony_1/wisata/indexwisata.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  late bool _passwordVisible;

  final DatabaseHelper dbhelper = DatabaseHelper();

  @override
  void initState() {
    _passwordVisible = false;
    super.initState();
  }


  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void authentication(BuildContext context) async {
    bool isLoginValid = await dbhelper.validateUser(
      _emailController.text,
      _passwordController.text,
    );

    if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
      DialogHelper.errorDialog(context, "Please fill in all fields.");
    } else if (!isLoginValid) {
      DialogHelper.errorDialog(context, "Invalid email or password.");
    } else {
      Future.delayed(const Duration(seconds: 1), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => IndexWisata()),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const SizedBox(height: 20),

                // Logo
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    'assets/image/symphony.png',
                    width: 150,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                ),

                const SizedBox(height: 30),

                // Email Field
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "E-mail/username",
                      style: TextStyle(fontSize: 14, color: Colors.black),
                    ),
                    const SizedBox(height: 4),
                    TextField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: "JohnDoe@gmail.com",
                        hintStyle: const TextStyle(fontSize: 12),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                      ),
                      style: const TextStyle(fontSize: 12, color: Colors.black),
                    ),
                  ],
                ),

                const SizedBox(height: 10),

                // Password Field with Eye Icon
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Password",
                      style: TextStyle(fontSize: 14, color: Colors.black),
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

                const SizedBox(height: 30),

                // Login Button
                ElevatedButton(
                  onPressed: () {
                    String email = _emailController.text.trim();
                    String password = _passwordController.text.trim();

                    authentication(context);

                    // Tampilkan ke console
                    print('Email: $email');
                    print('Password: $password');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0A285F),
                    minimumSize: const Size(288, 63),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text("Login"),
                ),

                const SizedBox(height: 10),

                // Create Account Button (Baru) - Menggunakan ElevatedButton
                ElevatedButton(
                  onPressed: () {
                    // Navigasi ke halaman RegisterPage
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RegisterPage(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green, // Warna latar tombol
                    minimumSize: const Size(
                      double.infinity,
                      50,
                    ), // Ukuran penuh lebar
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        8,
                      ), // Sudut melengkung
                    ),
                  ),
                  child: const Text(
                    "Buat Akun Baru",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),

                // const Spacer(),

                // Or Login With
                const Text('Or Login With'),
                const SizedBox(height: 10),

                // Social Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () => print('Google pressed'),
                      icon: const Icon(Icons.g_mobiledata),
                      color: Colors.blue,
                      splashColor: Colors.blue.withOpacity(0.2),
                    ),
                    IconButton(
                      onPressed: () => print('Facebook pressed'),
                      icon: const Icon(Icons.facebook),
                      color: Colors.blue,
                      splashColor: Colors.blue.withOpacity(0.2),
                    ),
                    IconButton(
                      onPressed: () => print('GitHub pressed'),
                      icon: const Icon(Icons.code),
                      color: Colors.black,
                      splashColor: Colors.grey.withOpacity(0.2),
                    ),
                    IconButton(
                      onPressed: () => print('Twitter pressed'),
                      icon: const Icon(Icons.edit),
                      color: Colors.blue,
                      splashColor: Colors.blue.withOpacity(0.2),
                    ),
                  ],
                ),

                const SizedBox(height: 10),

                const Spacer(),
                // Footer
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
      ),
    );
  }
}
