import 'package:flutter/material.dart';
import 'package:themoviedb/library/widgets/inherited/provider.dart';
import 'package:themoviedb/ui/widgets/movie_details/movie_details_model.dart';

import 'movie_details_main_info_widget.dart';
import 'movie_details_main_screen_cast_widget.dart';

class MovieDetailsWidget extends StatefulWidget {
  final int movieId;
  const MovieDetailsWidget({super.key, required this.movieId});

  @override
  State<MovieDetailsWidget> createState() => _MovieDetailsWidgetState();
}

class _MovieDetailsWidgetState extends State<MovieDetailsWidget> {
  @override
  void didChangeDependencies() {
    final model = context
        .getInheritedWidgetOfExactType<NotifyProvider<MovieDetailsModel>>()
        ?.model;
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    model?.getMovie();
  }

  @override
  Widget build(BuildContext context) {
    final model = context
        .dependOnInheritedWidgetOfExactType<NotifyProvider<MovieDetailsModel>>()
        ?.model;
    if (model == null) return const Placeholder();
    if (model.movieDetailsResponse == null) {
      return const Center(
        child: SizedBox(
            width: 15,
            height: 15,
            child: CircularProgressIndicator(
              strokeWidth: 2,
            )),
      );
    }
    final title = model.movieDetailsResponse?.title ?? 'The film';
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          MovieDetailsMainInfoWidget(
            model: model,
          ),
          MovieDetailsMainScreenCastWidget()
        ],
      ),
    );
  }
}
