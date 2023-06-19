import 'package:bloc/bloc.dart';
import 'package:movies_app/core/usecase/base_usecase.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies/domain/usecases/get_now_playing_movies.dart';
import 'package:movies_app/movies/presentaion/controller/movies_events.dart';
import 'package:movies_app/movies/presentaion/controller/movies_states.dart';
import '../../domain/usecases/get_popluar_movies_usecase.dart';
import '../../domain/usecases/get_top_rated_movies_usecase.dart';

class MoviesBloc extends Bloc<MoviesEvent,MoviesState>{

  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase ;
  final GetPopularMoviesUseCase getPopularMoviesUseCase ;
  final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase ;

  MoviesBloc(
      this.getNowPlayingMoviesUseCase,
      this.getPopularMoviesUseCase,
      this.getTopRatedMoviesUseCase
      ): super(const MoviesState()){
    on<GetNowPlayingEvent>(_getNowPlayingMovies);

    on<GetPopularEvent>(_getPopularMovies);

    on<GetTopRatedEvent>(_getTopRatedMovies);
  }
  Future<void> _getNowPlayingMovies(GetNowPlayingEvent event, Emitter<MoviesState> emit)async{
    print('_getNowPlayingMovies');
    final result = await getNowPlayingMoviesUseCase(const NoParameters());
    result.fold(
            (l)=> emit(
            state.copyWith(
                nowPlayingState: RequestState.error,
                message: l.message
            )),
            (r)=> emit(state.copyWith(
          nowPlayingMovies: r,
          nowPlayingState: RequestState.loaded,
        ))
    );
  }

  Future<void> _getPopularMovies(GetPopularEvent event, Emitter<MoviesState> emit) async{
    print('_getPopularMovies');
    final result = await getPopularMoviesUseCase(const NoParameters());
    result.fold(
            (l) => emit(state.copyWith(
                popularState: RequestState.error,
                popularMessage: l.message
            )),
            (r) => emit(state.copyWith(
              popularMovies: r,
              popularState: RequestState.loaded,
            ))
    );
  }

  Future<void> _getTopRatedMovies(GetTopRatedEvent event, Emitter<MoviesState> emit) async{
    print('_getTopRatedMovies');
    final result = await getTopRatedMoviesUseCase(const NoParameters());
    result.fold(
            (l) => emit(state.copyWith(
            topRatedState: RequestState.error,
            topRatedMessage: l.message
        )),
            (r) => emit(state.copyWith(
          topRatedMovies: r,
          topRatedState: RequestState.loaded,
        ))
    );
  }


}