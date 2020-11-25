import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

User userModelFromJson(String str) => User.fromJson(json.decode(str));

Login loginFromJson(String str) => Login.fromLoginJson(json.decode(str));

String userModelToJson(User data) => json.encode(data.toJson());

class Login {
  final String id;
  final String userId;
  final String token;

  Login({
    this.id,
    this.userId,
    this.token,
  });

  factory Login.fromLoginJson(Map<String, dynamic> json) {
    return Login(
      id: json['id'] as String,
      userId: json['user']['id'] as String,
      token: json['value'] as String,
    );
  }
}

class User {
  final String id;
  final String name;
  final String phone;
  final String email;
  final String password;
  final String confirmPassword;
  final String createdAt;

  User({
    this.id,
    this.name,
    @required this.phone,
    this.email,
    @required this.password,
    this.confirmPassword,
    this.createdAt,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as String,
      name: json['name'] as String,
      phone: json['phone'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      createdAt: json['createdAt'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "Username": phone,
      "Password": password,
    };
  }
}
