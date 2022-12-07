import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';

List<User>? usersFromJson(String str) {
  debugPrint("response = ");
  debugPrint(str);

  List<dynamic>? usersList = json.decode(str)["data"];
  List<User>? users = usersList?.map((user) => User.fromJson(user)).toList();
  inspect(users);

  return users;
}

String userToJson(List<User> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User {
  User({
    required this.id,
    required this.email,
    required this.firstName,
    this.lastName,
    this.avatar,
  });

  int id;
  String email;
  String firstName;
  String? lastName;
  String? avatar;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        email: json["email"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        avatar: json["avatar"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
        "avatar": avatar,
      };
}
