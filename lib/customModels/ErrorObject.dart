import 'dart:core';
import 'package:json_annotation/json_annotation.dart';

part 'ErrorObject.g.dart';

@JsonSerializable()
class ErrorObject {
  ErrorObject({required this.errorCode, required this.errorText});

  int errorCode;
  String errorText;

  factory ErrorObject.fromJson(Map<String, dynamic> json) =>
      _$ErrorObjectFromJson(json);
  Map<String, dynamic> toJson() => _$ErrorObjectToJson(this);
}
