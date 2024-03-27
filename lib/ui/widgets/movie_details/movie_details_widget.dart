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
    late final body;
    if (model.movieDetailsResponse == null) {
      body = const Center(
        child: SizedBox(
            width: 30,
            height: 30,
            child: CircularProgressIndicator(
              strokeWidth: 4,
            )),
      );
    } else {
      body = ListView(
        children: [
          MovieDetailsMainInfoWidget(
            model: model,
          ),
          MovieDetailsMainScreenCastWidget(
            model: model,
          )
        ],
      );
    }
    final title = model.movieDetailsResponse?.title ?? 'Loading';
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: body,
    );
  }
}
