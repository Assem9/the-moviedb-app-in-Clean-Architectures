import 'package:dartz/dartz.dart';
import 'package:movies_app/movies/domain/entities/movie.dart';

import '../../../core/error/failuer.dart';
import '../entities/movie_details.dart';
import '../entities/recommendation.dart';

abstract class BaseMoviesRepository{
  Future<Either<Failure,List<Movie>>> getNowPlayingMovies();

  Future<Either<Failure,List<Movie>>> getPopularMovies();

  Future<Either<Failure,List<Movie>>> getTopRatedMovies();

  Future<Either<Failure, MovieDetails>> getMovieDetails(int movieId);

  Future<Either<Failure, List<Recommendation>>> getMovieRecommendations(int id);

}