import 'package:movies_app/movies/domain/entities/genre.dart';

class GenreModel extends Genre{
  const GenreModel(super.name, super.id);
  factory GenreModel.fromJson(Map<String, dynamic> json){
    return GenreModel(json['name'], json['id']);
  }
}