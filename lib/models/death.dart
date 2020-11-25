import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

Death deathModelFromJson(String str) => Death.fromJson(json.decode(str));

String deathModelToJson(Death data) => json.encode(data.toJson());

class Death {
  final String boxId;
  final String id;
  final int number;
  final String createdAt;

  Death({
    @required this.boxId,
    this.id,
    @required this.number,
    this.createdAt,
  });

  factory Death.fromJson(Map<String, dynamic> json) {
    return Death(
      boxId: json['box']['id'] as String,
      id: json['id'] as String,
      number: json['number'] as int,
      createdAt: json['createdAt'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "box": {"id": boxId},
      "number": number,
    };
  }
}
