import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

Expense expenseModelFromJson(String str) => Expense.fromJson(json.decode(str));

String expenseModelToJson(Expense data) => json.encode(data.toJson());

class Expense {
  final String boxId;
  final String id;
  final int amount;
  final String description;
  final String createdAt;

  Expense({
    @required this.boxId,
    this.id,
    @required this.amount,
    @required this.description,
    this.createdAt,
  });

  factory Expense.fromJson(Map<String, dynamic> json) {
    return Expense(
      boxId: json['box']['id'] as String,
      id: json['id'] as String,
      amount: json['amount'] as int,
      description: json['description'] as String,
      createdAt: json['createdAt'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "box": {"id": boxId},
      "amount": amount,
      "description": description
    };
  }
}
