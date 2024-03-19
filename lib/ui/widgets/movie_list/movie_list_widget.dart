import 'package:flutter/material.dart';
import 'package:themoviedb/domain/api_client/api_client.dart';
import 'package:themoviedb/resources/images.dart';
import 'package:themoviedb/ui/navigation/main_navigation.dart';
import 'package:themoviedb/ui/widgets/movie_list/movie_list_model.dart';
import '../../Theme/app_colors.dart';

class MovieListWidget extends StatelessWidget {
  MovieListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final model = MovieListModelProvider.watch(context)?.model;

    if (model == null) return const SizedBox.shrink();
    return Stack(
      children: [
        ListView.builder(
            padding: const EdgeInsets.only(top: 70),
            itemCount: model.movies.length ?? 0,
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            controller: model.scrollController,
            itemBuilder: (BuildContext context, int index) {
              model.showedMovieOnIndex(index);
              // if (index >= model.movies.length) return null;
              final movie = model.movies[index];
              final posterPath = movie.posterPath;
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Stack(children: [
                  Container(
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: Colors.black.withOpacity(0.2)),
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              offset: const Offset(0, 2),
                              blurRadius: 8)
                        ]),
                    clipBehavior: Clip.hardEdge,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Image(width: 94, height: 141, image: movie.imageName),
                        (posterPath != null)
                            ? Image.network(
                                ApiClient.imageUrl(posterPath),
                                width: 95,
                              )
                            : const SizedBox(
                                width: 95,
                              ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  movie.title,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  model.dateFormatter(movie),
                                  style: const TextStyle(
                                      fontSize: 12, color: Colors.grey),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  movie.overview,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Positioned.fill(
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                          onTap: () => model.onMovieTap(context, index)),
                    ),
                  )
                ]),
              );
            }),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: TextField(
            controller: model.textEditingController,
            onChanged: (text) async {
              await model.onChanged(text, context);
            },
            decoration: InputDecoration(
              label: const Text('Search'),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: const BorderSide(
                    color: AppColors.mainDarkBlue,
                  )),
              filled: true,
              fillColor: Colors.white.withOpacity(0.8),
            ),
          ),
        )
      ],
    );
  }
}
