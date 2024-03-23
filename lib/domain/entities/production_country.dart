import 'package:json_annotation/json_annotation.dart';

part 'production_country.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ProductionCountry {
  final String? iso31661;
  final String name;
  ProductionCountry({required this.iso31661, required this.name});

  factory ProductionCountry.fromJson(Map<String, dynamic> json) =>
      _$ProductionCountryFromJson(json);
  Map<String, dynamic> toJson() => _$ProductionCountryToJson(this);
}
