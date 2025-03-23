import 'package:json_annotation/json_annotation.dart';

part 'array_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class ArrayResponse<T> {
  @JsonKey(name: 'statusCode')
  final int? statusCode;

  @JsonKey(name: 'success')
  final bool? success;

  @JsonKey(name: 'message')
  final String? message;

  @JsonKey(name: 'error')
  final String? error;

  @JsonKey(name: 'records')
  final List<T>? records;

  factory ArrayResponse.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$ArrayResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) =>
      _$ArrayResponseToJson(this, toJsonT);

  const ArrayResponse({
    this.statusCode,
    this.success,
    this.error,
    this.records,
    this.message,
  });
}
