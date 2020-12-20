// To parse this JSON data, do
//
//     final productResponse = productResponseFromJson(jsonString);

import 'dart:convert';

import 'bikes_data_model.dart';

ProductResponse productResponseFromJson(String str) => ProductResponse.fromJson(json.decode(str));

String productResponseToJson(ProductResponse data) => json.encode(data.toJson());

class ProductResponse {
  ProductResponse({
    this.code,
    this.message,
    this.data,
  });

  int code;
  String message;
  Data data;

  factory ProductResponse.fromJson(Map<String, dynamic> json) => ProductResponse(
    code: json["code"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "message": message,
    "data": data.toJson(),
  };

  @override
  String toString() {
    return 'ProductResponse{code: $code, message: $message, data: $data}';
  }
}




