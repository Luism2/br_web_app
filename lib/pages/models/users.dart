import 'dart:convert';
import 'package:br_web_app/pages/models/role.dart';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  String? id;
  String? email;
  String? userCode;
  String? name;
  String? password;
  String? sessionToken;
  List<Rol?> roles = [];

  User({
    this.id,
    this.email,
    this.userCode,
    this.name,
    this.password,
    this.sessionToken,
    required this.roles,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"] is int ? json['id'].toString() : json["id"],
        email: json["email"],
        userCode: json["user_code"],
        name: json["name"],
        password: json["password"],
        sessionToken: json["session_token"],
        roles: json["roles"] == null
            ? []
            : List<Rol>.from(json['roles'].map((model) => Rol.fromJson(model))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "user_code": userCode,
        "name": name,
        "password": password,
        "session_token": sessionToken,
        "roles": roles,
      };
}
