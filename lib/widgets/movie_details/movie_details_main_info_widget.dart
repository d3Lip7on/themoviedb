import 'package:flutter/material.dart';
import 'package:themoviedb/resources/images.dart';

class MovieDetailsMainInfoWidget extends StatelessWidget {
  const MovieDetailsMainInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(66, 20, 20, 1.0),
      child: const Column(
        children: [
          _TopPosterWidget(),
          SizedBox(
            height: 20,
          ),
          _MovieTitleWidget(),
          SizedBox(
            height: 20,
          ),
          _MovieButtonRow(),
          SizedBox(
            height: 20,
          ),
          _MovieInfo(),
          _MovieOverview(),
          _PeopleWidget(),
        ],
      ),
    );
  }
}

class _TopPosterWidget extends StatelessWidget {
  const _TopPosterWidget({super.key});

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
  const _MovieTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Убийцы Цветочной Луны ',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          '(2023)',
          style: TextStyle(
            fontSize: 15,
            color: Color.fromRGBO(180, 180, 180, 1.0),
          ),
        )
      ],
    );
  }
}

class _MovieButtonRow extends StatelessWidget {
  const _MovieButtonRow({super.key});

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
  const _MovieInfo({super.key});

  @override
  Widget build(BuildContext context) {
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
              const Text(
                '20/10/2023 (PL)',
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
              const Text(
                '3h 26m',
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
  const _MovieOverview({super.key});

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
  const _PeopleWidget({super.key});

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
