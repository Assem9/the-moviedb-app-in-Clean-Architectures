import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies/domain/entities/recommendation.dart';
import 'package:movies_app/movies/domain/usecases/get_recommendations_usecase.dart';

import '../../domain/entities/movie_details.dart';
import '../../domain/usecases/get_movie_details_usecase.dart';

part 'movies_details_event.dart';
part 'movies_details_state.dart';

class MoviesDetailsBloc extends Bloc<MoviesDetailsEvent, MoviesDetailsState> {
  final GetMovieDetailsUseCase getMovieDetailsUseCase;
  final GetRecommendationsUseCase getRecommendationsUseCase;

  MoviesDetailsBloc(this.getMovieDetailsUseCase, this.getRecommendationsUseCase) : super(const MoviesDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);
    on<GetMovieRecommendationsEvent>(_getMovieRecommendations);
  }

  Future<void> _getMovieDetails(GetMovieDetailsEvent event ,Emitter<MoviesDetailsState> emit)async{
    final result = await getMovieDetailsUseCase(event.id);
    result.fold((l){
      emit(state.copyWith(
        movieRequestState: RequestState.error,
        message: l.message
      ));
    }, (r){
      emit(state.copyWith(
        movieDetails: r,
          movieRequestState: RequestState.loaded,
          message: '',
      ));
    });
  }

  Future<void> _getMovieRecommendations(GetMovieRecommendationsEvent event ,Emitter<MoviesDetailsState> emit)async{
    final result = await getRecommendationsUseCase(RecommendationParameters(event.id));
    result.fold((l){
      emit(state.copyWith(
          recommendationState: RequestState.error,
          recommendationsMessage: l.message
      ));
    }, (r){
      emit(state.copyWith(
        recommendations: r,
        recommendationState: RequestState.loaded,
      ));
      print('from res${r.length}');
    });
    print('from state${state.recommendations.length}');
  }
}
