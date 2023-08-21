class User {
  final String email, phone, user, pass;

  User(
      {required this.email,
      required this.phone,
      required this.user,
      required this.pass});

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'phone': phone,
      'user': user,
      'pass': pass,
    };
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        email: json['email'],
        phone: json['phone'],
        user: json['user'],
        pass: json['pass']);
  }
}
