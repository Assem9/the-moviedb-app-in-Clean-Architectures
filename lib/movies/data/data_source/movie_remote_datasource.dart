import 'package:dio/dio.dart';
import 'package:movies_app/core/error/excption.dart';
import 'package:movies_app/core/network/api_constants.dart';
import 'package:movies_app/core/network/errior_msg_model.dart';
import 'package:movies_app/movies/data/models/movie_details_model.dart';
import 'package:movies_app/movies/data/models/movie_model.dart';
import 'package:movies_app/movies/data/models/recommendation_model.dart';

abstract class BaseMovieRemoteDataSource {
  Future<List<MovieModel>> getNowPlayingMovies() ;
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getTopRatedMovies();
  Future<MovieDetailsModel>getMovieDetails(int id);
  Future<List<RecommendationModel>> getRecommendations(int id);
}

class MovieRemoteDataSource extends BaseMovieRemoteDataSource{

  @override
  Future<List<MovieModel>> getNowPlayingMovies() async{
    final response =
    await Dio().get(ApiConstants.nowPlayingMoviesPath);
    print('now res ${response.statusMessage}');
    if(response.statusCode == 200){
      return List<MovieModel>.from((response.data["results"] as List)
          .map((e)=> MovieModel.fromJson(e))
      );
    }else{
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data)
      );
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async{
    final response =
    await Dio().get(ApiConstants.popularMoviesPath);
    print('pop res ${response.statusMessage}');
    if(response.statusCode == 200){
      return List<MovieModel>.from((response.data["results"] as List)
          .map((e) => MovieModel.fromJson(e))
      );
    }else{
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data)
      );
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies()  async{
    final response =
    await Dio().get(ApiConstants.topRatedMoviesPath);
    print('top res ${response.statusMessage}');
    if(response.statusCode == 200){
      return List<MovieModel>.from((response.data["results"] as List)
          .map((e) => MovieModel.fromJson(e))
      );
    }else{
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data)
      );
    }
  }

  @override
  Future<MovieDetailsModel> getMovieDetails(int id)  async{
    final response =
    await Dio().get(ApiConstants.movieDetailsPath(id));
    print('top res ${response.statusMessage}');
    if(response.statusCode == 200){
      return MovieDetailsModel.fromJson(response.data) ;
    }else{
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data)
      );
    }
  }

  @override
  Future<List<RecommendationModel>> getRecommendations(int id)  async{
    final response =
    await Dio().get(ApiConstants.movieRecommendationsPath(id));
    print('top res ${response.statusMessage}');
    if(response.statusCode == 200){
      return List<RecommendationModel>.from((response.data["results"] as List)
          .map((e) => RecommendationModel.fromJson(e))
      );
    }else{
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data)
      );
    }
  }


}