import 'package:carousel_slider/carousel_slider.dart';
import 'package:deapmovies/Api/Api.dart';
import 'package:deapmovies/Models/movieDetail_model.dart';
import 'package:deapmovies/Models/movie_model.dart';
import 'package:deapmovies/Shared/appColors.dart';
import 'package:flutter/material.dart';

class movieDetail extends StatefulWidget {
  const movieDetail({super.key, required this.id});
  final int id;

  @override
  State<movieDetail> createState() => _movieDetailState();
}

class _movieDetailState extends State<movieDetail> {
  late Future<MovieDetail> moviedetail;

  @override
  void initState() {
    moviedetail = Api().getMovieData(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors().primaryColor,
      appBar: AppBar(
        backgroundColor: AppColors().primaryColor,
        title: new RichText(
          text: new TextSpan(
            children: <TextSpan>[
              new TextSpan(
                  text: 'Deap',
                  style: new TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors().accentColor,
                      fontSize: 20)),
              new TextSpan(
                  text: 'movies',
                  style: new TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20)),
            ],
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.notifications,
                color: Colors.white,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: FutureBuilder(
                  future: moviedetail,
                  builder: (context, snapshot) {
                    final movie = snapshot.data!;
                    return Column(children: [
                      Container(
                        height: 400,
                        width: double.infinity,
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          "https://image.tmdb.org/t/p/original/${movie!.backdropPath}" ??
                                              "https://image.tmdb.org/t/p/original/${movie!.posterPath}"),
                                      fit: BoxFit.cover)),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    colors: [
                                      Colors.black.withOpacity(0.2),
                                      AppColors().primaryColor
                                    ],
                                    stops: [
                                      0.3,
                                      0.9
                                    ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter),
                              ),
                            ),
                            Positioned(
                              left: 20,
                              bottom: 40,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Container(
                                    height: 140,
                                    width: 100,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                "https://image.tmdb.org/t/p/original/${movie!.backdropPath}" ??
                                                    "https://image.tmdb.org/t/p/original/${movie!.posterPath}"),
                                            fit: BoxFit.cover)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          movie.title! ?? "No data",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16),
                                        ),
                                        Text(
                                          "Rating - ${movie.voteAverage!.toString()}",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.normal,
                                              fontSize: 10),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                          "Released - ${movie.releaseDate!.toString()}",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.normal,
                                              fontSize: 10),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          movie.overview!,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                              fontSize: 14),
                        ),
                      ),
                    ]);
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
