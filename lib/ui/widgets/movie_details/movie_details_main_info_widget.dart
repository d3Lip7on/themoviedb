import 'package:flutter/material.dart';
import 'package:themoviedb/resources/images.dart';

import '../../../library/widgets/inherited/provider.dart';
import 'movie_details_model.dart';

class MovieDetailsMainInfoWidget extends StatelessWidget {
  final MovieDetailsModel model;
  const MovieDetailsMainInfoWidget({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(66, 20, 20, 1.0),
      child: Column(
        children: [
          _TopPosterWidget(
            model: model,
          ),
          const SizedBox(
            height: 20,
          ),
          _MovieTitleWidget(
            model: model,
          ),
          const SizedBox(
            height: 20,
          ),
          _MovieButtonRow(
            model: model,
          ),
          const SizedBox(
            height: 20,
          ),
          _MovieInfo(
            model: model,
          ),
          _MovieOverview(
            model: model,
          ),
          _PeopleWidget(
            model: model,
          ),
        ],
      ),
    );
  }
}

class _TopPosterWidget extends StatelessWidget {
  final MovieDetailsModel model;
  const _TopPosterWidget({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        Image(image: Images.backgroundImage),
        Positioned(
            top: 20,
            left: 20,
            child: Image(
              width: 94,
              image: Images.image,
            )),
      ],
    );
  }
}

class _MovieTitleWidget extends StatelessWidget {
  final MovieDetailsModel model;
  const _MovieTitleWidget({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    final movie = model.movieDetailsResponse;
    final title = movie?.title ?? '';
    final releaseDateYear = '(${movie?.releaseDate?.year})' ?? '0';

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          releaseDateYear,
          style: const TextStyle(
            fontSize: 15,
            color: Color.fromRGBO(180, 180, 180, 1.0),
          ),
        )
      ],
    );
  }
}

class _MovieButtonRow extends StatelessWidget {
  final MovieDetailsModel model;
  const _MovieButtonRow({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    const mainTextStyle = TextStyle(
      color: Colors.white,
      fontSize: 14,
      fontWeight: FontWeight.w700,
    );
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
              onPressed: () {},
              child: const Text(
                'Рейтинг',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              )),
          const _MovieButtonRowDivider(),
          TextButton(
              onPressed: () {},
              child: const Row(
                children: [
                  Icon(
                    Icons.play_arrow,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Воспроизвести трейлер',
                    style: mainTextStyle,
                  ),
                ],
              ))
        ],
      ),
    );
  }
}

class _MovieButtonRowDivider extends StatelessWidget {
  const _MovieButtonRowDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1,
      height: 20,
      color: Colors.grey,
    );
  }
}

class _MovieInfo extends StatelessWidget {
  final MovieDetailsModel model;
  const _MovieInfo({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    final movie = model.movieDetailsResponse;
    final releaseDate = model.dateFormatter(movie?.releaseDate);
    final runtime = movie?.runtime;
    const mainTextStyle = TextStyle(
      color: Colors.white,
      fontSize: 14,
      fontWeight: FontWeight.w700,
    );
    return Container(
      color: const Color.fromRGBO(40, 15, 15, 1.0),
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 20,
                height: 20,
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.grey)),
                child: const Center(
                  child: Text(
                    'R',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                releaseDate,
                style: mainTextStyle,
              ),
              const SizedBox(
                width: 6,
              ),
              const Icon(
                Icons.circle,
                color: Colors.white,
                size: 8,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                model.runtimeFormatter(runtime),
                style: mainTextStyle,
              ),
            ],
          ),
          const Text(
            'криминал, драма, история',
            style: mainTextStyle,
          ),
        ],
      ),
    );
  }
}

class _MovieOverview extends StatelessWidget {
  final MovieDetailsModel model;
  const _MovieOverview({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    const mainTextStyle = TextStyle(
      color: Colors.white,
      fontSize: 14,
    );
    return const Padding(
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Greed is an animal that hungers for blood.',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 16,
              fontStyle: FontStyle.italic,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Обзор',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
              'Вскоре после Первой мировой Эрнест Беркхарт, отслуживший во '
              'Франции поваром, приезжает искать удачи в Оклахому, где '
              'находится крупная резервация индейцев племени осейдж. В '
              'тех краях живет его дядя Уильям Хэйл, который носит '
              'прозвище Король — он землевладелец, скотопромышленник, '
              'друг индейцев и большой человек. Король убеждает Эрнеста '
              'посвататься к Молли Кайл, молодой женщине из зажиточной '
              'индейской семьи. Идея состоит в том, чтобы земельные права'
              ' этой семьи со временем перешли к Беркхарту (читай к '
              'Хэйлу), а для этого всего лишь должны умереть мама Молли, её сёстры и она сама.',
              style: mainTextStyle)
        ],
      ),
    );
  }
}

class _PeopleWidget extends StatelessWidget {
  final MovieDetailsModel model;
  const _PeopleWidget({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    const subtitleTextStyle = TextStyle(
      color: Colors.white,
      fontSize: 14,
    );
    const peopleTextStyle = TextStyle(
      color: Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.w700,
    );
    return const Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Martin Scorsese',
                      style: peopleTextStyle,
                    ),
                    Text(
                      'Director, Screenplay',
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
                      'David Grann',
                      style: peopleTextStyle,
                    ),
                    Text(
                      'Novel',
                      style: subtitleTextStyle,
                    )
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Column(
                children: [
                  Text(
                    'Eric Roth',
                    style: peopleTextStyle,
                  ),
                  Text(
                    'Screenplay',
                    style: subtitleTextStyle,
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
