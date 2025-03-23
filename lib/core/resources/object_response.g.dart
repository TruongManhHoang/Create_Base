// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'object_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ObjectResponse<T> _$ObjectResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    ObjectResponse<T>(
      statusCode: (json['statusCode'] as num?)?.toInt(),
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: _$nullableGenericFromJson(json['data'], fromJsonT),
      error: json['error'] as String?,
    )..shopRepository = json['shopRepository'];

Map<String, dynamic> _$ObjectResponseToJson<T>(
  ObjectResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'success': instance.success,
      'message': instance.message,
      'error': instance.error,
      'data': _$nullableGenericToJson(instance.data, toJsonT),
      'shopRepository': instance.shopRepository,
    };

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) =>
    input == null ? null : toJson(input);
