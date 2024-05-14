import 'dart:convert';

import 'package:deapmovies/Features/Movie/movieDetail.dart';
import 'package:deapmovies/Models/movieDetail_model.dart';
import 'package:deapmovies/Models/movie_model.dart';
import 'package:deapmovies/Api/key.dart';
import 'package:http/http.dart' as http;

class Api {
  final upcomingMoviesUrl =
      "https://api.themoviedb.org/3/movie/upcoming?api_key=$apiKey";
  final popularMoviesUrl =
      "https://api.themoviedb.org/3/movie/popular?api_key=$apiKey";
  final topRatedMoviesUrl =
      "https://api.themoviedb.org/3/movie/top_rated?api_key=$apiKey";
  final nowPlayingMoviesUrl =
      "https://api.themoviedb.org/3/movie/now_playing?api_key=$apiKey";
  final movieDetailUrl = "https://api.themoviedb.org/3/movie/?api_key=$apiKey";

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
    final response = await http.get(Uri.parse(popularMoviesUrl));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['results'];
      List<Movie> movies = data.map((movie) => Movie.fromJson(movie)).toList();
      return movies;
    } else {
      throw Exception(' Failed to load data sets');
    }
  }

  Future<List<Movie>> gettopRatedMovies() async {
    final response = await http.get(Uri.parse(topRatedMoviesUrl));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['results'];
      List<Movie> movies = data.map((movie) => Movie.fromJson(movie)).toList();
      return movies;
    } else {
      throw Exception(' Failed to load data sets');
    }
  }

  Future<List<Movie>> getnowPlayingMovies() async {
    final response = await http.get(Uri.parse(nowPlayingMoviesUrl));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['results'];
      List<Movie> movies = data.map((movie) => Movie.fromJson(movie)).toList();
      return movies;
    } else {
      throw Exception(' Failed to load data sets');
    }
  }

  Future<MovieDetail> getMovieData(int movieId) async {
    final response = await http.get(Uri.parse(
        "https://api.themoviedb.org/3/movie/$movieId?api_key=$apiKey"));
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      var movie = MovieDetail.fromJson(data);
      return movie;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
