
import 'dart:convert';

class AuthModel {
  String email;
  String password;

  AuthModel({
    required this.email,
    required this.password,
  });

  factory AuthModel.fromRawJson(String str) => AuthModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
    email: json["email"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "email": email,
    "password": password,
  };
}
