part of 'movies_details_bloc.dart';

abstract class MoviesDetailsEvent extends Equatable {
  const MoviesDetailsEvent();
}

class GetMovieDetailsEvent extends MoviesDetailsEvent{
  final int id ;

  const GetMovieDetailsEvent(this.id);
  @override
  // TODO: implement props
  List<Object?> get props => [id];
}

class GetMovieRecommendationsEvent extends MoviesDetailsEvent{
  final int id ;

  const GetMovieRecommendationsEvent(this.id);
  @override
  List<Object?> get props => [id];
}
