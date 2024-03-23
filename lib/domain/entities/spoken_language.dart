import 'package:json_annotation/json_annotation.dart';

part 'spoken_language.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class SpokenLanguage {
  final String englishName;
  final String? iso6391;
  final String name;

  SpokenLanguage(
      {required this.name, required this.englishName, required this.iso6391});
  factory SpokenLanguage.fromJson(Map<String, dynamic> json) =>
      _$SpokenLanguageFromJson(json);
  Map<String, dynamic> toJson() => _$SpokenLanguageToJson(this);
}
