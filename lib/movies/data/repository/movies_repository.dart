import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/excption.dart';
import 'package:movies_app/core/error/failuer.dart';
import 'package:movies_app/movies/data/data_source/movie_remote_datasource.dart';
import 'package:movies_app/movies/domain/entities/movie.dart';
import 'package:movies_app/movies/domain/entities/movie_details.dart';
import 'package:movies_app/movies/domain/entities/recommendation.dart';
import 'package:movies_app/movies/domain/repository/base_movie_repository.dart';

class MovieRepository extends BaseMoviesRepository{
  final BaseMovieRemoteDataSource baseMovieRemoteDataSource ;

  MovieRepository(this.baseMovieRemoteDataSource);


  @override
  Future<Either<Failure,List<Movie>>> getNowPlayingMovies() async{
    final result =  await baseMovieRemoteDataSource.getNowPlayingMovies();
    try{
      return (Right(result));
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure,List<Movie>>> getPopularMovies() async{
    final result =  await baseMovieRemoteDataSource.getPopularMovies();
    try{
      return (Right(result));
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure,List<Movie>>> getTopRatedMovies() async{
    final result =  await baseMovieRemoteDataSource.getTopRatedMovies();
    try{
      return (Right(result));
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, MovieDetails>> getMovieDetails(int movieId) async{
    final result =  await baseMovieRemoteDataSource.getMovieDetails(movieId);
    try{
      return (Right(result));
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }

  }

  @override
  Future<Either<Failure, List<Recommendation>>> getMovieRecommendations(int id) async{
    final result = await baseMovieRemoteDataSource.getRecommendations(id);
    try{
      return (Right(result));
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

}