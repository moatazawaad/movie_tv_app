import 'package:flutter/material.dart';
import 'package:movie_tv_app_clean_arch/core/services/services_locator.dart';

import 'core/utils/app_string.dart';
import 'movies/persentation/screens/movies_screen.dart';

void main() {
  ServicesLocator().init();
  // Movie myMovie = const Movie(
  //   id: 1,
  //   title: "title",
  //   backdrobPath: "img",
  //   overview: "view",
  //   genreIds: [0],
  //   voteAverage: 1.1,
  //   releaseDate: "2022",
  // );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppString.appName,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.grey.shade800,
      ),
      home: const MoviesScreen(),
    );
  }
}
