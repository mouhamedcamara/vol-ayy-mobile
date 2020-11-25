import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

Sale saleModelFromJson(String str) => Sale.fromJson(json.decode(str));

String saleModelToJson(Sale data) => json.encode(data.toJson());

class Sale {
  final String boxId;
  final String id;
  final String clientName;
  final int clientNumber;
  final int quantity;
  final int unitPrice;
  final int totalPrice;
  final String location;
  final bool status;
  final String createdAt;

  Sale({
    @required this.boxId,
    this.id,
    @required this.clientName,
    this.clientNumber,
    @required this.quantity,
    @required this.unitPrice,
    @required this.totalPrice,
    @required this.location,
    @required this.status,
    this.createdAt,
  });

  factory Sale.fromJson(Map<String, dynamic> json) {
    return Sale(
      boxId: json['box']['id'] as String,
      id: json['id'] as String,
      clientName: json['client_name'] as String,
      clientNumber: json['client_number'] as int,
      quantity: json['quantity'] as int,
      unitPrice: json['unit_price'] as int,
      totalPrice: json['total_price'] as int,
      location: json['location'] as String,
      status: json['status'] as bool,
      createdAt: json['createdAt'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "box": {"id": boxId},
      "client_name": clientName,
      "client_number": clientNumber,
      "quantity": quantity,
      "unit_price": unitPrice,
      "total_price": totalPrice,
      "location": location,
      "status": status,
    };
  }
}
