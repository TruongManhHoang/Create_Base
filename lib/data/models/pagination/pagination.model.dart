import 'package:json_annotation/json_annotation.dart';

part 'pagination.model.g.dart';

@JsonSerializable()
class PaginationModel {
  final int currentPage;
  final int perPage;
  final int totalPages;
  final int totalItems;

  PaginationModel({
    required this.currentPage,
    required this.perPage,
    required this.totalPages,
    required this.totalItems,
  });

  factory PaginationModel.fromJson(Map<String, dynamic> json) =>
      _$PaginationModelFromJson(json);

  Map<String, dynamic> toJson() => _$PaginationModelToJson(this);
}
