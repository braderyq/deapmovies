import 'dart:convert';

import 'package:deapmovies/Models/movie_model.dart';
import 'package:deapmovies/key.dart';
import 'package:http/http.dart' as http;

class Api {
  final upcomingMoviesUrl =
      "https://api.themoviedb.org/3/movie/popular?api_key=$apiKey";
  final popularMoviesUrl =
      "https://api.themoviedb.org/3/movie/popular?api_key=$apiKey";
  final topRatedMoviesUrl =
      "https://api.themoviedb.org/3/movie/popular?api_key=$apiKey";
  final nowPlayingMoviesUrl =
      "https://api.themoviedb.org/3/movie/popular?api_key=$apiKey";

  Future<List<Movie>> getUpcomingMovies() async {
    final response = await http.get(Uri.parse(upcomingMoviesUrl));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['results'];
      List<Movie> movies = data.map((movie) => Movie.fromJson(movie)).toList();
      return movies;
    } else {
      throw Exception(' Failed to load data sets');
    }
  }

  Future<List<Movie>> getpopularMovies() async {
    final response = await http.get(Uri.parse(upcomingMoviesUrl));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['results'];
      List<Movie> movies = data.map((movie) => Movie.fromJson(movie)).toList();
      return movies;
    } else {
      throw Exception(' Failed to load data sets');
    }
  }

  Future<List<Movie>> gettopRatedMovies() async {
    final response = await http.get(Uri.parse(upcomingMoviesUrl));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['results'];
      List<Movie> movies = data.map((movie) => Movie.fromJson(movie)).toList();
      return movies;
    } else {
      throw Exception(' Failed to load data sets');
    }
  }

  Future<List<Movie>> getnowPlayingMovies() async {
    final response = await http.get(Uri.parse(upcomingMoviesUrl));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['results'];
      List<Movie> movies = data.map((movie) => Movie.fromJson(movie)).toList();
      return movies;
    } else {
      throw Exception(' Failed to load data sets');
    }
  }

  Future<List<Movie>> getMovieData(int movieId) async {
    final response = await http.get(Uri.parse(upcomingMoviesUrl));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['results'];
      List<Movie> movies = data.map((movie) => Movie.fromJson(movie)).toList();
      return movies;
    } else {
      throw Exception(' Failed to load data sets');
    }
  }
}
