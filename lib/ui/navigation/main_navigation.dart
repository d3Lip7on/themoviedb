import 'package:flutter/material.dart';
import 'package:themoviedb/ui/widgets/movie_details/movie_details_model.dart';

import '../../library/widgets/inherited/provider.dart';
import '../widgets/auth/auth_model.dart';
import '../widgets/auth/auth_widget.dart';
import '../widgets/main_screen/main_screen_model.dart';
import '../widgets/main_screen/main_screen_widget.dart';
import '../widgets/movie_details/movie_details_widget.dart';

abstract class MainNavigationRoutesNames {
  static const auth = 'auth';
  static const mainScreen = '/';
  static const movieDetails = '/movie_details';
}

class MainNavigation {
  String initialRoute(bool isAuth) => isAuth
      ? MainNavigationRoutesNames.mainScreen
      : MainNavigationRoutesNames.auth;
  final routes = <String, Widget Function(BuildContext)>{
    MainNavigationRoutesNames.auth: (context) =>
        NotifyProvider(model: AuthModel(), child: const AuthWidget()),
    MainNavigationRoutesNames.mainScreen: (context) => NotifyProvider(
        model: MainScreenModel(), child: const MainScreenWidget()),
  };
  Route<Object> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case MainNavigationRoutesNames.movieDetails:
        final arguments = settings.arguments;
        final movieId = arguments is int ? arguments : 0;
        return MaterialPageRoute(
            builder: (context) => NotifyProvider(
                  model: MovieDetailsModel(movieId: movieId),
                  child: MovieDetailsWidget(
                    movieId: movieId,
                  ),
                ));
      default:
        const widget = Text('Navigation error');
        return MaterialPageRoute(builder: (context) => widget);
    }
  }
}
