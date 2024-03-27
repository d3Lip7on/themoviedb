// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crew_member.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CrewMember _$CrewMemberFromJson(Map<String, dynamic> json) => CrewMember(
      profilePath: json['profile_path'] as String?,
      originalName: json['original_name'] as String,
      knownForDepartment: json['known_for_department'] as String,
      gender: json['gender'] as int,
      creditId: json['credit_id'] as String,
      id: json['id'] as int,
      popularity: (json['popularity'] as num).toDouble(),
      adult: json['adult'] as bool,
      name: json['name'] as String,
      department: json['department'] as String,
      job: json['job'] as String,
    );

Map<String, dynamic> _$CrewMemberToJson(CrewMember instance) =>
    <String, dynamic>{
      'adult': instance.adult,
      'gender': instance.gender,
      'id': instance.id,
      'known_for_department': instance.knownForDepartment,
      'name': instance.name,
      'original_name': instance.originalName,
      'popularity': instance.popularity,
      'profile_path': instance.profilePath,
      'credit_id': instance.creditId,
      'department': instance.department,
      'job': instance.job,
    };
