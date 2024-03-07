import 'package:flutter/material.dart';
import 'package:themoviedb/resources/images.dart';
import 'package:themoviedb/ui/navigation/main_navigation.dart';
import '../../Theme/app_colors.dart';

class Movie {
  final int id;
  final AssetImage imageName;
  final String title;
  final String time;
  final String description;

  Movie({
    required this.id,
    required this.imageName,
    required this.title,
    required this.time,
    required this.description,
  });
}

class MovieListWidget extends StatefulWidget {
  MovieListWidget({super.key});

  @override
  State<MovieListWidget> createState() => _MovieListWidgetState();
}

class _MovieListWidgetState extends State<MovieListWidget> {
  final _movies = [
    Movie(
      id: 1,
      imageName: Images.image,
      title: 'Убийцы цветочной луны',
      time: '18 октября 2023',
      description: 'Вскоре после Первой мировой Эрнест Беркхарт, '
          'отслуживший во Франции поваром, приезжает искать удачи в Оклахому, где находится крупная резервация индейцев племени осейдж. В тех краях живет его дядя Уильям Хэйл, который носит прозвище Король — он землевладелец, скотопромышленник, друг индейцев и большой человек. Король убеждает Эрнеста посвататься к Молли Кайл, молодой женщине из зажиточной индейской семьи. Идея состоит в том, чтобы земельные права этой семьи со временем перешли к Беркхарту (читай к Хэйлу), а для этого всего лишь должны умереть мама Молли, её сёстры и она сама.',
    ),
    Movie(
      id: 2,
      imageName: Images.image,
      title: 'Человек паук',
      time: '18 октября 2023',
      description: 'Вскоре после Первой мировой Эрнест Беркхарт, '
          'отслуживший во Франции поваром, приезжает искать удачи в Оклахому, где находится крупная резервация индейцев племени осейдж. В тех краях живет его дядя Уильям Хэйл, который носит прозвище Король — он землевладелец, скотопромышленник, друг индейцев и большой человек. Король убеждает Эрнеста посвататься к Молли Кайл, молодой женщине из зажиточной индейской семьи. Идея состоит в том, чтобы земельные права этой семьи со временем перешли к Беркхарту (читай к Хэйлу), а для этого всего лишь должны умереть мама Молли, её сёстры и она сама.',
    ),
    Movie(
      id: 3,
      imageName: Images.image,
      title: 'Трансформеры',
      time: '18 октября 2023',
      description: 'Вскоре после Первой мировой Эрнест Беркхарт, '
          'отслуживший во Франции поваром, приезжает искать удачи в Оклахому, где находится крупная резервация индейцев племени осейдж. В тех краях живет его дядя Уильям Хэйл, который носит прозвище Король — он землевладелец, скотопромышленник, друг индейцев и большой человек. Король убеждает Эрнеста посвататься к Молли Кайл, молодой женщине из зажиточной индейской семьи. Идея состоит в том, чтобы земельные права этой семьи со временем перешли к Беркхарту (читай к Хэйлу), а для этого всего лишь должны умереть мама Молли, её сёстры и она сама.',
    ),
    Movie(
      id: 4,
      imageName: Images.image,
      title: 'Человек паук 2',
      time: '18 октября 2023',
      description: 'Вскоре после Первой мировой Эрнест Беркхарт, '
          'отслуживший во Франции поваром, приезжает искать удачи в Оклахому, где находится крупная резервация индейцев племени осейдж. В тех краях живет его дядя Уильям Хэйл, который носит прозвище Король — он землевладелец, скотопромышленник, друг индейцев и большой человек. Король убеждает Эрнеста посвататься к Молли Кайл, молодой женщине из зажиточной индейской семьи. Идея состоит в том, чтобы земельные права этой семьи со временем перешли к Беркхарту (читай к Хэйлу), а для этого всего лишь должны умереть мама Молли, её сёстры и она сама.',
    ),
    Movie(
      id: 5,
      imageName: Images.image,
      title: 'Бойцовский клуб',
      time: '18 октября 2023',
      description: 'Вскоре после Первой мировой Эрнест Беркхарт, '
          'отслуживший во Франции поваром, приезжает искать удачи в Оклахому, где находится крупная резервация индейцев племени осейдж. В тех краях живет его дядя Уильям Хэйл, который носит прозвище Король — он землевладелец, скотопромышленник, друг индейцев и большой человек. Король убеждает Эрнеста посвататься к Молли Кайл, молодой женщине из зажиточной индейской семьи. Идея состоит в том, чтобы земельные права этой семьи со временем перешли к Беркхарту (читай к Хэйлу), а для этого всего лишь должны умереть мама Молли, её сёстры и она сама.',
    ),
    Movie(
      id: 6,
      imageName: Images.image,
      title: 'Левша',
      time: '18 октября 2023',
      description: 'Вскоре после Первой мировой Эрнест Беркхарт, '
          'отслуживший во Франции поваром, приезжает искать удачи в Оклахому, где находится крупная резервация индейцев племени осейдж. В тех краях живет его дядя Уильям Хэйл, который носит прозвище Король — он землевладелец, скотопромышленник, друг индейцев и большой человек. Король убеждает Эрнеста посвататься к Молли Кайл, молодой женщине из зажиточной индейской семьи. Идея состоит в том, чтобы земельные права этой семьи со временем перешли к Беркхарту (читай к Хэйлу), а для этого всего лишь должны умереть мама Молли, её сёстры и она сама.',
    ),
    Movie(
      id: 7,
      imageName: Images.image,
      title: 'Бегущий по лезвию',
      time: '18 октября 2023',
      description: 'Вскоре после Первой мировой Эрнест Беркхарт, '
          'отслуживший во Франции поваром, приезжает искать удачи в Оклахому, где находится крупная резервация индейцев племени осейдж. В тех краях живет его дядя Уильям Хэйл, который носит прозвище Король — он землевладелец, скотопромышленник, друг индейцев и большой человек. Король убеждает Эрнеста посвататься к Молли Кайл, молодой женщине из зажиточной индейской семьи. Идея состоит в том, чтобы земельные права этой семьи со временем перешли к Беркхарту (читай к Хэйлу), а для этого всего лишь должны умереть мама Молли, её сёстры и она сама.',
    ),
    Movie(
      id: 8,
      imageName: Images.image,
      title: 'Трансофрмеры 2',
      time: '18 октября 2023',
      description: 'Вскоре после Первой мировой Эрнест Беркхарт, '
          'отслуживший во Франции поваром, приезжает искать удачи в Оклахому, где находится крупная резервация индейцев племени осейдж. В тех краях живет его дядя Уильям Хэйл, который носит прозвище Король — он землевладелец, скотопромышленник, друг индейцев и большой человек. Король убеждает Эрнеста посвататься к Молли Кайл, молодой женщине из зажиточной индейской семьи. Идея состоит в том, чтобы земельные права этой семьи со временем перешли к Беркхарту (читай к Хэйлу), а для этого всего лишь должны умереть мама Молли, её сёстры и она сама.',
    ),
  ];

  var _filteredMovies = [];

  final _searchController = TextEditingController();

  void _searchMovies() {
    final query = _searchController.text;
    if (query.isNotEmpty) {
      _filteredMovies = _movies.where((Movie movie) {
        return (movie.title.toLowerCase().contains(query.toLowerCase()));
      }).toList();
    } else {
      _filteredMovies = _movies;
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _filteredMovies = _movies;
    _searchController.addListener(_searchMovies);
  }

  void _onMovieTap(index) {
    final id = _filteredMovies[index].id;
    Navigator.of(context)
        .pushNamed(MainNavigationRoutesNames.movieDetails, arguments: id);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.builder(
            padding: const EdgeInsets.only(top: 70),
            itemCount: _filteredMovies.length,
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            itemBuilder: (BuildContext context, int index) {
              final movie = _filteredMovies[index];
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
                        Image(width: 94, height: 141, image: movie.imageName),
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
                                  movie.time,
                                  style: const TextStyle(
                                      fontSize: 12, color: Colors.grey),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  movie.description,
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
                      child: InkWell(onTap: () => _onMovieTap(index)),
                    ),
                  )
                ]),
              );
            }),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: TextField(
            controller: _searchController,
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
