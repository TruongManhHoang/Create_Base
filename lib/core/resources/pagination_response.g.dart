// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginationResponse<T> _$PaginationResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    PaginationResponse<T>(
      pagination: (json['pagination'] as List<dynamic>?)
          ?.map((e) => PaginationModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      statusCode: (json['statusCode'] as num?)?.toInt(),
      success: json['success'] as bool?,
      error: json['error'] as String?,
      records: (json['records'] as List<dynamic>?)?.map(fromJsonT).toList(),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$PaginationResponseToJson<T>(
  PaginationResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'success': instance.success,
      'message': instance.message,
      'error': instance.error,
      'pagination': instance.pagination,
      'records': instance.records?.map(toJsonT).toList(),
    };
