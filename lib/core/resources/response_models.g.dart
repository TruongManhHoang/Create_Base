// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ErrorModel _$ErrorModelFromJson(Map<String, dynamic> json) => ErrorModel(
      message: json['message'] as String?,
      error: json['error'] as String?,
      statusCode: (json['statusCode'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ErrorModelToJson(ErrorModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'error': instance.error,
      'statusCode': instance.statusCode,
    };
