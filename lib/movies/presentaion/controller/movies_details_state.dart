part of 'movies_details_bloc.dart';

class MoviesDetailsState extends Equatable {
  final MovieDetails? movieDetails ;
  final RequestState movieRequestState ;
  final String message ;
  final List<Recommendation> recommendations ;
  final RequestState recommendationState ;
  final String recommendationsMessage ;

  const MoviesDetailsState({
    this.movieDetails,
    this.movieRequestState = RequestState.loading,
    this.message = '',
    this.recommendations= const[],
    this.recommendationState = RequestState.loading,
    this.recommendationsMessage = '',
});

  MoviesDetailsState copyWith({
    MovieDetails? movieDetails,
    RequestState? movieRequestState ,
    String? message,
    List<Recommendation>? recommendations,
    RequestState? recommendationState,
    String? recommendationsMessage,
  }){
    return MoviesDetailsState(
      movieDetails:  movieDetails?? this.movieDetails,
      movieRequestState: movieRequestState?? this.movieRequestState,
      message: message?? this.message,
        recommendations:recommendations??this.recommendations,
        recommendationState:recommendationState??this.recommendationState,
        recommendationsMessage:recommendationsMessage??this.recommendationsMessage,
    );
  }

  @override
  List<Object> get props => [
    //movieDetails,
    movieRequestState,
    message,
    recommendations,
    recommendationState,
    recommendationsMessage,
  ];
}

