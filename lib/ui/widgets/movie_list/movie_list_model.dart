import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:themoviedb/domain/api_client/api_client.dart';
import 'package:themoviedb/domain/entities/movie.dart';
import 'package:themoviedb/ui/navigation/main_navigation.dart';

class MovieListModel extends ChangeNotifier {
  final _apiClient = ApiClient();
  var _movies = <Movie>[];

  List<Movie> get movies => List.unmodifiable(_movies);

  Future<void> loadMovies() async {
    final moviesResponse = (await _apiClient.getPopularMovies()).movies;
    _movies.addAll(moviesResponse);
    notifyListeners();
  }

  void onMovieTap(BuildContext context, int index) {
    final id = _movies[index].id;
    Navigator.of(context)
        .pushNamed(MainNavigationRoutesNames.movieDetails, arguments: id);
  }

  String dateFormatter(Movie movie) {
    final date = movie.releaseDate;
    if (date == null) return '';
    final year = date.year.toString();
    final month = _numberZeroingFormatter(date.month);
    final day = _numberZeroingFormatter(date.day);
    return "$year-$month-$day";
  }

  String _numberZeroingFormatter(int num) {
    if (num < 10) return '0$num';
    return num.toString();
  }
}

class MovieListModelProvider extends InheritedNotifier {
  final MovieListModel model;
  const MovieListModelProvider({
    super.key,
    required Widget child,
    required this.model,
  }) : super(child: child, notifier: model);

  static MovieListModelProvider? watch(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MovieListModelProvider>();
  }

  static MovieListModelProvider? get(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<MovieListModelProvider>()
        ?.widget;
    return widget is MovieListModelProvider ? widget : null;
  }
}
