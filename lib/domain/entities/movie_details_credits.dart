import 'package:json_annotation/json_annotation.dart';

import 'actor.dart';
import 'crew_member.dart';

part 'movie_details_credits.g.dart';

@JsonSerializable(explicitToJson: true)
class MovieDetailsCredits {
  final int id;
  final List<Actor> cast;
  final List<CrewMember> crew;

  MovieDetailsCredits(
      {required this.id, required this.cast, required this.crew});

  factory MovieDetailsCredits.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailsCreditsFromJson(json);
  Map<String, dynamic> toJson() => _$MovieDetailsCreditsToJson(this);
}
