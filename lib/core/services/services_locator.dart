import 'package:get_it/get_it.dart';
import 'package:movies_app/movies/data/data_source/movie_remote_datasource.dart';
import 'package:movies_app/movies/data/repository/movies_repository.dart';
import 'package:movies_app/movies/domain/repository/base_movie_repository.dart';
import 'package:movies_app/movies/domain/usecases/get_now_playing_movies.dart';
import 'package:movies_app/movies/domain/usecases/get_recommendations_usecase.dart';
import 'package:movies_app/movies/presentaion/controller/movies_bloc.dart';

import '../../movies/domain/usecases/get_movie_details_usecase.dart';
import '../../movies/domain/usecases/get_popluar_movies_usecase.dart';
import '../../movies/domain/usecases/get_top_rated_movies_usecase.dart';
final getIt = GetIt.instance ;
class ServiceLocator{

  void init(){

    getIt.registerLazySingleton<BaseMovieRemoteDataSource>(
            () => MovieRemoteDataSource()
    );
    getIt.registerLazySingleton<BaseMoviesRepository>(
            () => MovieRepository(getIt())
    );

    getIt.registerLazySingleton(
            () => GetNowPlayingMoviesUseCase(getIt())
    );
    getIt.registerLazySingleton(
            () => GetMovieDetailsUseCase(getIt())
    );
    getIt.registerLazySingleton(
            () => GetRecommendationsUseCase(getIt())
    );
    getIt.registerLazySingleton(
            () => GetPopularMoviesUseCase(getIt())
    );
    getIt.registerLazySingleton(
            () => GetTopRatedMoviesUseCase(getIt())
    );
    getIt.registerLazySingleton(
            () => MoviesBloc(getIt(),getIt(),getIt(),)
    );
  }


}