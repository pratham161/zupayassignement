import 'package:flutter/material.dart';
import 'package:zupay/classes/movieData.dart';
import 'package:provider/provider.dart';
import 'package:zupay/components/movieTile.dart';

class MovieList extends StatefulWidget {
  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  MovieData movieData = MovieData();

  @override
  Widget build(BuildContext context) {
    return Consumer<MovieData>(builder: (context, movieData, child) {
      return movieData.movies.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.movie_creation_outlined,
                    size: 150,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Tap add button to add Movies',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 10,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            )
          : ListView.builder(
              itemCount: movieData.movies.length,
              itemBuilder: (context, index) {
                final movie = movieData.movies[index];
                return MovieTile(
                    image: movie.image,
                    onPressed: () {
                      Provider.of<MovieData>(context, listen: false)
                          .deleteMovie(movie);
                    },
                    name: movie.movieName,
                    director: movie.directorName);
              },
            );
    });
  }
}
