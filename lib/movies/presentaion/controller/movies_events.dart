import 'package:equatable/equatable.dart';

abstract class MoviesEvent extends Equatable{
  const MoviesEvent();
}

class GetNowPlayingEvent extends MoviesEvent{
  @override
  List<Object?> get props => [];
}

class GetPopularEvent extends MoviesEvent{
  @override
  List<Object?> get props => [];
}

class GetTopRatedEvent extends MoviesEvent{
  @override
  List<Object?> get props => [];
}