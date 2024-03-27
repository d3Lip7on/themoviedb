import 'package:json_annotation/json_annotation.dart';

part 'actor.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Actor {
  final bool adult;
  final int gender;
  final int id;
  final String knownForDepartment;
  final String name;
  final String originalName;
  final double popularity;
  final String? profilePath;
  final int castId;
  final String character;
  final String creditId;
  final int order;

  Actor(
      {required this.name,
      required this.adult,
      required this.popularity,
      required this.id,
      required this.castId,
      required this.character,
      required this.creditId,
      required this.gender,
      required this.knownForDepartment,
      required this.order,
      required this.originalName,
      required this.profilePath});

  factory Actor.fromJson(Map<String, dynamic> json) => _$ActorFromJson(json);
  Map<String, dynamic> toJson() => _$ActorToJson(this);
}
