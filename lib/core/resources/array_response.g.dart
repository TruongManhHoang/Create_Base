// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'array_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArrayResponse<T> _$ArrayResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    ArrayResponse<T>(
      statusCode: (json['statusCode'] as num?)?.toInt(),
      success: json['success'] as bool?,
      error: json['error'] as String?,
      records: (json['records'] as List<dynamic>?)?.map(fromJsonT).toList(),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$ArrayResponseToJson<T>(
  ArrayResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'success': instance.success,
      'message': instance.message,
      'error': instance.error,
      'records': instance.records?.map(toJsonT).toList(),
    };
