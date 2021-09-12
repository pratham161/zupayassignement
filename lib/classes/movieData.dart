import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:zupay/classes/movie.dart';

class MovieData extends ChangeNotifier {
  List<Movie> _movies = [];

  UnmodifiableListView<Movie> get movies {
    return UnmodifiableListView(_movies);
  }

  void addMovie(
    String image,
    name,
    director,
  ) {
    final movie = Movie(image: image, movieName: name, directorName: director);
    _movies.add(movie);
    notifyListeners();
  }

  void deleteMovie(Movie movie) {
    _movies.remove(movie);
    notifyListeners();
  }
}
