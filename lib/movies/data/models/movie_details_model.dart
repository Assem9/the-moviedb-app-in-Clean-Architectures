import 'package:equatable/equatable.dart';
import 'package:movies_app/movies/data/models/genre_model.dart';
import 'package:movies_app/movies/domain/entities/movie_details.dart';

class MovieDetailsModel extends MovieDetails{
  const MovieDetailsModel({
    required super.backdropPath,
    required super.id,
    required super.genres,
    required super.overView,
    required super.releaseDate,
    required super.runTime,
    required super.title,
    required super.voteAverage
  });

  factory MovieDetailsModel.fromJson(Map<String,dynamic> json){
    return MovieDetailsModel(
        backdropPath: json['backdrop_path'],
        id: json['id'],
        genres: List<GenreModel>.from(json['genres'].map((e)=> GenreModel.fromJson(e))) ,
        overView: json['overview'],
        releaseDate: json['release_date'],
        runTime: json['runtime'],
        title: json['title'],
        voteAverage: json['vote_average'].toDouble(),
    );
  }

}