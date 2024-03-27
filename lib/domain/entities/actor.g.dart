// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'actor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Actor _$ActorFromJson(Map<String, dynamic> json) => Actor(
      name: json['name'] as String,
      adult: json['adult'] as bool,
      popularity: (json['popularity'] as num).toDouble(),
      id: json['id'] as int,
      castId: json['cast_id'] as int,
      character: json['character'] as String,
      creditId: json['credit_id'] as String,
      gender: json['gender'] as int,
      knownForDepartment: json['known_for_department'] as String,
      order: json['order'] as int,
      originalName: json['original_name'] as String,
      profilePath: json['profile_path'] as String?,
    );

Map<String, dynamic> _$ActorToJson(Actor instance) => <String, dynamic>{
      'adult': instance.adult,
      'gender': instance.gender,
      'id': instance.id,
      'known_for_department': instance.knownForDepartment,
      'name': instance.name,
      'original_name': instance.originalName,
      'popularity': instance.popularity,
      'profile_path': instance.profilePath,
      'cast_id': instance.castId,
      'character': instance.character,
      'credit_id': instance.creditId,
      'order': instance.order,
    };
