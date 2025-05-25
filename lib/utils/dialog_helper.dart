import 'package:flutter/material.dart';

class DialogHelper {
  // Dialog Error Umum
  static void errorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Error'),
        content: Text(message.isNotEmpty ? message : 'Terjadi kesalahan'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  // Dialog Sukses Dinamis
  static void successDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Success'),
        content: Text(message.isNotEmpty ? message : 'Operasi berhasil.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  static void chooseDialog(BuildContext context, String message, String btn1,
      String nav1, String btn2, String nav2) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Success'),
        content: Text(message.isNotEmpty ? message : 'Operasi berhasil.'),
        actions: [
          TextButton(
            onPressed: () => nav1,
            child: Text(btn1),
          ),
          TextButton(
            onPressed: () => nav2,
            child: Text(btn2),
          ),
        ],
      ),
    );
  }
}
