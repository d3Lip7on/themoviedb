import 'package:flutter/material.dart';

import '../../../domain/api_client/api_client.dart';
import '../../../domain/entities/movie_details_response.dart';

class MovieDetailsModel extends ChangeNotifier {
  final int movieId;
  final _apiClient = ApiClient();
  MovieDetailsResponse? movieDetailsResponse;
  MovieDetailsModel({required this.movieId});

  final genres = [];

  void getMovie() async {
    movieDetailsResponse = await _apiClient.getMovieDetails(movieId);
    notifyListeners();
  }

  String dateFormatter(DateTime? releaseDate) {
    if (releaseDate == null) return '';
    final formattedString =
        '${releaseDate.day}/${releaseDate.month}/${releaseDate.year}';
    return formattedString;
  }

  String runtimeFormatter(int? minutes) {
    if (minutes == null) return '';
    final hours = (minutes ~/ 60).toString();
    final restOfMinutes = (minutes % 60).toString();
    final formattedRuntime = '${hours}h ${restOfMinutes}min';
    return formattedRuntime;
  }
}
