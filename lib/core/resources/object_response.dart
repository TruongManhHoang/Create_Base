import 'package:json_annotation/json_annotation.dart';

part 'object_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class ObjectResponse<T> {
  @JsonKey(name: 'statusCode')
  final int? statusCode;
  @JsonKey(name: 'success')
  final bool? success;
  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'error')
  final String? error;

  @JsonKey(name: 'data')
  final T? data;

  var shopRepository;

  factory ObjectResponse.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$ObjectResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) =>
      _$ObjectResponseToJson(this, toJsonT);

   ObjectResponse({
    this.statusCode,
    this.success,
    this.message,
    this.data,
    this.error,
  });
}