import 'package:equatable/equatable.dart';

import 'genre.dart';

class MovieDetails extends Equatable {
  final String backdropPath ;
  final List<Genre> genres ;
  final int id;
  final String overView ;
  final String releaseDate ;
  final int runTime ;
  final String title ;
  final double voteAverage;

  const MovieDetails( {
    required this.backdropPath,
    required this.id,
    required this.genres,
    required this.overView,
    required this.releaseDate,
    required this.runTime,
    required this.title,
    required this.voteAverage
  });
 // final List<> geners ;



  @override
  // TODO: implement props
  List<Object?> get props => [
    backdropPath,
    id,
    genres,
    overView,
    releaseDate,
    runTime,
    title,
    voteAverage,
  ] ;

}
