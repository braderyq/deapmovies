import 'package:carousel_slider/carousel_slider.dart';
import 'package:deapmovies/Api/Api.dart';
import 'package:deapmovies/Features/Movie/movieDetail.dart';
import 'package:deapmovies/Models/movie_model.dart';
import 'package:deapmovies/Shared/appColors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<List<Movie>> upcomingMovies;
  late Future<List<Movie>> nowPlayingMoviesUrl;
  late Future<List<Movie>> topRatedMoviesUrl;

  @override
  void initState() {
    upcomingMovies = Api().getUpcomingMovies();
    nowPlayingMoviesUrl = Api().getnowPlayingMovies();
    topRatedMoviesUrl = Api().gettopRatedMovies();
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
              height: 450,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                  image: DecorationImage(
                      colorFilter: ColorFilter.mode(
                          AppColors().primaryColor, BlendMode.screen),
                      image: NetworkImage(
                          "https://mir-s3-cdn-cf.behance.net/project_modules/1400/b3c40a78219513.5cc812e957de6.jpg"),
                      fit: BoxFit.cover)),
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                            Colors.transparent,
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
                    bottom: 100,
                    left: 0,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 40,
                          width: 100,
                          decoration: BoxDecoration(
                              color: AppColors().accentColor,
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.play_arrow,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text("Play",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.normal)),
                            ],
                          )),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                          height: 40,
                          width: 100,
                          decoration: BoxDecoration(
                              color: AppColors().secondaryColor,
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
                              child: Text("Details",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.normal))),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 8, top: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "For You",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Container(
                    height: 250,
                    child: FutureBuilder(
                        future: topRatedMoviesUrl,
                        builder: (context, snapshot) {
                          final movies = snapshot.data!;
                          return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 10,
                            itemBuilder: (context, index) {
                              final movie = movies[index];
                              return Padding(
                                padding: const EdgeInsets.only(
                                    right: 10.0, bottom: 10),
                                child: GestureDetector(
                                  onTap: () {
                                    print(movie.id);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => movieDetail(
                                                id: movie.id!,
                                              )),
                                    );
                                  },
                                  child: Container(
                                    width: 150,
                                    decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Image.network(
                                        "https://image.tmdb.org/t/p/original/${movie!.posterPath}",
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        }),
                  ),
                  Text(
                    "Trending Now",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Container(
                    height: 250,
                    child: FutureBuilder(
                        future: upcomingMovies,
                        builder: (context, snapshot) {
                          final movies = snapshot.data!;
                          return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 10,
                            itemBuilder: (context, index) {
                              final movie = movies[index];
                              return Padding(
                                padding: const EdgeInsets.only(
                                    right: 10.0, bottom: 10),
                                child: GestureDetector(
                                  onTap: () {
                                    print(movie.id);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => movieDetail(
                                                id: movie.id!,
                                              )),
                                    );
                                  },
                                  child: Container(
                                    width: 150,
                                    decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Image.network(
                                        "https://image.tmdb.org/t/p/original/${movie!.posterPath}",
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        }),
                  ),
                  // FutureBuilder(
                  // future: upcomingMovies,
                  // builder: (context, snapshot) {
                  //   if (snapshot.hasData) {
                  //     final movies = snapshot.data!;
                  //     return CarouselSlider.builder(
                  //       itemCount: movies.length,
                  //       itemBuilder: (context, index, moviesIndex) {
                  //         final movie = movies[index];
                  //         return Container(
                  //           width: double.infinity,
                  //           child: Stack(
                  //             children: [
                  //               Image.network(
                  //                 "https://image.tmdb.org/t/p/original/${movie.backdropPath}",
                  //                 fit: BoxFit.cover,
                  //               ),
                  //               Positioned(
                  //                 bottom: 50,
                  //                 left: 10,
                  //                 child: Column(
                  //                   crossAxisAlignment: CrossAxisAlignment.start,
                  //                   children: [
                  //                     Text(
                  //                       movie.title!,
                  //                       style: TextStyle(
                  //                           color: Colors.white,
                  //                           fontWeight: FontWeight.bold,
                  //                           fontSize: 20),
                  //                     ),
                  //                     Row(
                  //                       children: [
                  //                         Text(
                  //                           movie.releaseDate!.toString(),
                  //                           style: TextStyle(
                  //                               color: Colors.grey, fontSize: 12),
                  //                         ),
                  //                         Text(
                  //                           movie.voteCount!.toString(),
                  //                           style: TextStyle(
                  //                               color: Colors.green, fontSize: 20),
                  //                         ),
                  //                       ],
                  //                     ),
                  //                   ],
                  //                 ),
                  //               ),
                  //             ],
                  //           ),
                  //         );
                  //       },
                  //       options: CarouselOptions(
                  //           autoPlay: true,
                  //           enlargeCenterPage: true,
                  //           aspectRatio: 1.8,
                  //           autoPlayInterval: Duration(seconds: 20)),
                  //     );
                  //   }
                  //   final movies = snapshot.data!;
                  //   return ListView.builder(
                  //       itemCount: movies.length,
                  //       itemBuilder: (context, snapshot) {
                  //         return ListTile(
                  //           title: Text(
                  //             movies.first.title!,
                  //             style: TextStyle(color: Colors.black),
                  //           ),
                  //         );
                  //       });
                  // })
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
