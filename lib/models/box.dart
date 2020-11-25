import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

Box boxModelFromJson(String str) => Box.fromJson(json.decode(str));

String boxModelToJson(Box data) => json.encode(data.toJson());

Account accountModelFromJson(String str) => Account.fromJson(json.decode(str));

String accountModelToJson(Account data) => json.encode(data.toJson());

class Account {
  final String id;
  final int amount;
  final String createdAt;

  Account({this.id, this.amount, this.createdAt});

  factory Account.fromJson(Map<String, dynamic> json) {
    return Account(
      id: json['id'] as String,
      amount: json['amount'] as int,
      createdAt: json['createdAt'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {"amount": amount};
  }
}

class Box {
  final String userId;
  final String id;
  final String name;
  final int number;
  final int expense;
  final int death;
  final int age;
  final int vendu;
  final int revenu;
  final String createdAt;

  Box({
    this.userId,
    this.id,
    @required this.name,
    @required this.number,
    @required this.expense,
    this.death = 0,
    this.age = 0,
    this.vendu = 0,
    this.revenu = 0,
    this.createdAt,
  });

  factory Box.fromJson(Map<String, dynamic> json) {
    return Box(
      userId: json['user']['id'] as String,
      id: json['id'] as String,
      name: json['name'] as String,
      number: json['number'] as int,
      expense: json['expense'] as int,
      death: json['death'] as int,
      age: json['age'] as int,
      vendu: json['vendu'] as int,
      revenu: json['revenu'] as int,
      createdAt: json['createdAt'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "user": {"id": userId},
      "name": name,
      "number": number,
      "expense": expense,
      "death": death,
      "age": age,
      "vendu": vendu,
      "revenu": revenu,
    };
  }
}
