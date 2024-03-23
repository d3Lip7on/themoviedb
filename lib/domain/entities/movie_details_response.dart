import 'package:json_annotation/json_annotation.dart';
import 'package:themoviedb/domain/entities/production_company.dart';
import 'package:themoviedb/domain/entities/production_country.dart';
import 'package:themoviedb/domain/entities/spoken_language.dart';
import 'genre.dart';

part 'movie_details_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class MovieDetailsResponse {
  final bool adult;
  final String? backdropPath;
  // final String? belongsToCollection;
  final int budget;
  final List<Genre> genres;
  final String? homepage;
  final int id;
  final String? imdbId;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String? posterPath;
  final List<ProductionCompany> productionCompanies;
  final List<ProductionCountry> productionCountries;
  final DateTime? releaseDate;
  final int revenue;
  final int runtime;
  final List<SpokenLanguage> spokenLanguages;
  final String status;
  final String tagline;
  final String title;
  final bool video;
  final double voteAverage;
  final int voteCount;

  MovieDetailsResponse(
      {required this.id,
      required this.posterPath,
      required this.releaseDate,
      required this.overview,
      required this.title,
      required this.voteCount,
      required this.voteAverage,
      required this.video,
      required this.popularity,
      required this.originalTitle,
      required this.originalLanguage,
      required this.backdropPath,
      required this.adult,
      // required this.belongsToCollection,
      required this.budget,
      required this.genres,
      required this.homepage,
      required this.imdbId,
      required this.productionCompanies,
      required this.productionCountries,
      required this.revenue,
      required this.runtime,
      required this.spokenLanguages,
      required this.status,
      required this.tagline});

  factory MovieDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailsResponseFromJson(json);
  Map<String, dynamic> toJson() => _$MovieDetailsResponseToJson(this);
}
