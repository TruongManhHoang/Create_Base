// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginationModel _$PaginationModelFromJson(Map<String, dynamic> json) =>
    PaginationModel(
      currentPage: (json['currentPage'] as num).toInt(),
      perPage: (json['perPage'] as num).toInt(),
      totalPages: (json['totalPages'] as num).toInt(),
      totalItems: (json['totalItems'] as num).toInt(),
    );

Map<String, dynamic> _$PaginationModelToJson(PaginationModel instance) =>
    <String, dynamic>{
      'currentPage': instance.currentPage,
      'perPage': instance.perPage,
      'totalPages': instance.totalPages,
      'totalItems': instance.totalItems,
    };
