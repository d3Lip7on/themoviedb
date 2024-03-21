import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:themoviedb/domain/api_client/api_client.dart';
import 'package:themoviedb/domain/entities/movie.dart';
import 'package:themoviedb/ui/navigation/main_navigation.dart';

class MovieListModel extends ChangeNotifier {
  final _apiClient = ApiClient();
  final _movies = <Movie>[];
  late int _currentPage;
  late int _totalPages;
  bool _isLoadingInProgress = false;
  final textEditingController = TextEditingController();
  final scrollController = ScrollController();
  bool isInSearch = false;

  List<Movie> get movies => List.unmodifiable(_movies);

  late String _locale;

  void setupLocale(BuildContext context) {
    _locale = Localizations.localeOf(context).toLanguageTag();
    _movies.clear();
    _currentPage = 0;
    _totalPages = 1;
    _loadMovies();
  }

  Future<void> _loadMovies() async {
    if (_isLoadingInProgress || _totalPages <= _currentPage) return;
    _isLoadingInProgress = true;
    final nextPage = _currentPage + 1;
    late final moviesResponse;
    try {
      if (isInSearch) {
        final query = textEditingController.value.text;
        moviesResponse = await _apiClient.getMoviesByQuery(
            query: query, language: _locale, page: nextPage);
      } else {
        moviesResponse = (await _apiClient.getPopularMovies(
            language: _locale, page: nextPage));
      }

      _currentPage = moviesResponse.page;
      _totalPages = moviesResponse.totalPages;
      _movies.addAll(moviesResponse.movies);
      _isLoadingInProgress = false;
      notifyListeners();
    } catch (e) {
      _isLoadingInProgress = false;
    }
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

  void showedMovieOnIndex(int index) {
    if (index < _movies.length - 3) return;
    _loadMovies();
  }

  Future<void> moveToFirstElement() {
    return scrollController.animateTo(0.0,
        duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
  }

  Future<void> onChanged(String text, BuildContext context) async {
    moveToFirstElement();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!scrollController.position.isScrollingNotifier.value) {
        if (text.isEmpty) {
          isInSearch = false;
        } else {
          isInSearch = true;
        }
        setupLocale(context);
      }
    });
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
