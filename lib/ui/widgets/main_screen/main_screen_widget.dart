import 'package:flutter/material.dart';
import 'package:themoviedb/domain/api_client/data_providers/session_data_provider.dart';
import 'package:themoviedb/library/widgets/inherited/provider.dart';
import 'package:themoviedb/ui/navigation/main_navigation.dart';
import 'package:themoviedb/ui/widgets/movie_list/movie_list_model.dart';

import '../movie_list/movie_list_widget.dart';
import 'main_screen_model.dart';

class MainScreenWidget extends StatefulWidget {
  const MainScreenWidget({super.key});

  @override
  State<MainScreenWidget> createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget> {
  final movieListModel = MovieListModel();
  int _selectedTab = 1;

  void onSelectTab(int index) {
    if (_selectedTab == index) return;
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    movieListModel.setupLocale(context);
  }

  @override
  Widget build(BuildContext context) {
    final model = NotifyProvider.get<MainScreenModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('TMDB'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () async {
                await SessionDataProvider().setSessionId(null);
                Navigator.of(context)
                    .pushReplacementNamed(MainNavigationRoutesNames.auth);
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: IndexedStack(
        index: _selectedTab,
        children: [
          const Text('Index 0 : Home'),
          MovieListModelProvider(
              model: movieListModel, child: MovieListWidget()),
          const Text('Index 3: Serials')
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'News'),
          BottomNavigationBarItem(icon: Icon(Icons.movie), label: 'Movies'),
          BottomNavigationBarItem(icon: Icon(Icons.tv), label: 'Serials'),
        ],
        onTap: onSelectTab,
      ),
    );
  }
}
