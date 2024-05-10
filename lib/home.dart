import 'package:carousel_slider/carousel_slider.dart';
import 'package:deapmovies/Api.dart';
import 'package:deapmovies/Models/movie_model.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<List<Movie>> upcomingMovies;

  @override
  void initState() {
    upcomingMovies = Api().getUpcomingMovies();
    print(upcomingMovies.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Deap Movies"),
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            child: FutureBuilder(
                future: upcomingMovies,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final movies = snapshot.data!;
                    return CarouselSlider.builder(
                      itemCount: movies.length,
                      itemBuilder: (context, index, moviesIndex) {
                        final movie = movies[index];
                        return Container(
                          width: double.infinity,
                          child: Stack(
                            children: [
                              Image.network(
                                "https://image.tmdb.org/t/p/original/${movie.backdropPath}",
                                fit: BoxFit.cover,
                              ),
                              Positioned(
                                bottom: 50,
                                left: 10,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      movie.title!,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          movie.releaseDate!.toString(),
                                          style: TextStyle(
                                              color: Colors.grey, fontSize: 10),
                                        ),
                                        Text(
                                          movie.voteCount!.toString(),
                                          style: TextStyle(
                                              color: Colors.green,
                                              fontSize: 10),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      options: CarouselOptions(
                          autoPlay: true,
                          enlargeCenterPage: true,
                          aspectRatio: 1.8,
                          autoPlayInterval: Duration(seconds: 20)),
                    );
                  }
                  final movies = snapshot.data!;
                  return ListView.builder(
                      itemCount: movies.length,
                      itemBuilder: (context, snapshot) {
                        return ListTile(
                          title: Text(
                            movies.first.title!,
                            style: TextStyle(color: Colors.black),
                          ),
                        );
                      });
                }),
          )
        ],
      ),
    );
  }
}
