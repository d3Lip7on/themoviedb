import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:themoviedb/widgets/movie_details/movie_details_main_info_widget.dart';
import 'package:themoviedb/widgets/movie_details/movie_details_main_screen_cast_widget.dart';

class MovieDetailsWidget extends StatefulWidget {
  final int movieId;
  const MovieDetailsWidget({super.key, required this.movieId});

  @override
  State<MovieDetailsWidget> createState() => _MovieDetailsWidgetState();
}

class _MovieDetailsWidgetState extends State<MovieDetailsWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('The name of the film'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          MovieDetailsMainInfoWidget(),
          MovieDetailsMainScreenCastWidget()
        ],
      ),
    );
  }
}
