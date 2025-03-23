import 'package:create_base/data/models/pagination/pagination.model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pagination_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class PaginationResponse<T> {
  @JsonKey(name: 'statusCode')
  final int? statusCode;

  @JsonKey(name: 'success')
  final bool? success;

  @JsonKey(name: 'message')
  final String? message;

  @JsonKey(name: 'error')
  final String? error;

  @JsonKey(name: 'pagination')
  final List<PaginationModel>? pagination;

  @JsonKey(name: 'records')
  final List<T>? records;

  factory PaginationResponse.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$PaginationResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) =>
      _$PaginationResponseToJson(this, toJsonT);

  const PaginationResponse({
    this.pagination,
    this.statusCode,
    this.success,
    this.error,
    this.records,
    this.message,
  });
}
