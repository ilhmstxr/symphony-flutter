class User {
  final int id;
  final String email;
  final String password;

  User({
    required this.id,
    required this.email,
    required this.password,
  });

  // Konversi dari Map ke User
  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      email: map['email'],
      password: map['password'],
    );
  }

  // Konversi dari User ke Map
  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password,
    };
  }
}