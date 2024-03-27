import 'package:json_annotation/json_annotation.dart';

part 'crew_member.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class CrewMember {
  final bool adult;
  final int gender;
  final int id;
  final String knownForDepartment;
  final String name;
  final String originalName;
  final double popularity;
  final String? profilePath;
  final String creditId;
  final String department;
  final String job;

  CrewMember(
      {required this.profilePath,
      required this.originalName,
      required this.knownForDepartment,
      required this.gender,
      required this.creditId,
      required this.id,
      required this.popularity,
      required this.adult,
      required this.name,
      required this.department,
      required this.job});

  factory CrewMember.fromJson(Map<String, dynamic> json) =>
      _$CrewMemberFromJson(json);
  Map<String, dynamic> toJson() => _$CrewMemberToJson(this);
}
