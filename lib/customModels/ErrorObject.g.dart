// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ErrorObject.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ErrorObject _$ErrorObjectFromJson(Map<String, dynamic> json) {
  return ErrorObject(
    errorCode: json['errorCode'] as int,
    errorText: json['errorText'] as String,
  );
}

Map<String, dynamic> _$ErrorObjectToJson(ErrorObject instance) =>
    <String, dynamic>{
      'errorCode': instance.errorCode,
      'errorText': instance.errorText,
    };
