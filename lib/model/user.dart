class User
{
  final int success;
  final String message;
  final String name;
  final String role;
  final String token;

  User({
    required this.success,
    required this.message,
    required this.name,
    required this.role,
    required this.token,

  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      success: json['success'],
      message: json['message'],
      name: json['name'],
      role: json['role'],
      token: json['token'],
    );
  }
}


