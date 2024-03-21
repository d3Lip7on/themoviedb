import 'package:flutter/material.dart';
import 'package:themoviedb/library/widgets/inherited/provider.dart';
import 'package:themoviedb/ui/widgets/movie_details/movie_details_model.dart';

import 'movie_details_main_info_widget.dart';
import 'movie_details_main_screen_cast_widget.dart';

class MovieDetailsWidget extends StatelessWidget {
  final int movieId;
  const MovieDetailsWidget({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('The name of the film'),
        centerTitle: true,
      ),
      body: ListView(
        children: const [
          MovieDetailsMainInfoWidget(),
          MovieDetailsMainScreenCastWidget()
        ],
      ),
    );
  }
}
