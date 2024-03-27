import 'package:flutter/material.dart';
import 'package:themoviedb/domain/entities/crew_member.dart';

import '../../../domain/api_client/api_client.dart';
import '../../../domain/entities/actor.dart';
import '../../../domain/entities/movie_details_credits.dart';
import '../../../domain/entities/movie_details_response.dart';

class MovieDetailsModel extends ChangeNotifier {
  final int movieId;
  final _apiClient = ApiClient();
  MovieDetailsResponse? movieDetailsResponse;
  MovieDetailsCredits? movieDetailsCredits;
  MovieDetailsModel({required this.movieId});

  List<CrewMember>? _crew;
  List<Actor>? _cast;

  void getMovie() async {
    movieDetailsResponse = await _apiClient.getMovieDetails(movieId);
    movieDetailsCredits = await _apiClient.getMovieCredits(movieId);
    _crew = movieDetailsCredits?.crew;
    _cast = movieDetailsCredits?.cast;
    notifyListeners();
  }

  String createBackdropPath() {
    return 'http://image.tmdb.org/t/p/w500${movieDetailsResponse?.backdropPath}';
  }

  String createPosterPath() {
    return 'http://image.tmdb.org/t/p/w500${movieDetailsResponse?.posterPath}';
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

  String genresToString() {
    final genres = movieDetailsResponse?.genres;
    if (genres == null) return '';
    String listOfGenres = '';
    for (var element in genres) {
      listOfGenres = '$listOfGenres ${element.name},';
    }
    listOfGenres = listOfGenres.substring(0, listOfGenres.length - 1);
    return listOfGenres;
  }

  Widget createCrewGrid() {
    if (_crew == null) {
      return const Placeholder();
    }
    final crewLength = _crew!.length;
    final List<Widget> crewRows = [];
    for (var i = 0; i < crewLength; i = i + 2) {
      crewRows.add(_createCrewRow(i));
      crewRows.add(const SizedBox(
        height: 8,
      ));
    }
    return Column(
      children: crewRows,
    );
  }

  Widget _createCrewRow(int index) {
    if (_crew == null) {
      return const Placeholder();
    }
    const peopleTextStyle = TextStyle(
      color: Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.w700,
    );
    const subtitleTextStyle = TextStyle(
      color: Colors.white,
      fontSize: 14,
    );
    if (index + 1 >= _crew!.length) {
      return Row(
        children: [
          Column(
            children: [
              Text(
                _crew![index].name,
                style: peopleTextStyle,
              ),
              Text(
                _crew![index].job,
                style: subtitleTextStyle,
              ),
            ],
          )
        ],
      );
    } else {
      return Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _crew![index].name,
                  style: peopleTextStyle,
                ),
                Text(
                  _crew![index].job,
                  style: subtitleTextStyle,
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _crew![index + 1].name,
                  style: peopleTextStyle,
                ),
                Text(
                  _crew![index + 1].job,
                  style: subtitleTextStyle,
                )
              ],
            ),
          )
        ],
      );
    }
  }
}
