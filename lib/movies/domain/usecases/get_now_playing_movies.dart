import 'package:dartz/dartz.dart';
import 'package:movies_app/core/usecase/base_usecase.dart';
import 'package:movies_app/movies/domain/repository/base_movie_repository.dart';
import '../../../core/error/failuer.dart';
import '../entities/movie.dart';

class GetNowPlayingMoviesUseCase extends BaseUseCase<List<Movie>,NoParameters>{
  final BaseMoviesRepository repository ;
  GetNowPlayingMoviesUseCase(this.repository);

  @override
  Future<Either<Failure, List<Movie>>> call(NoParameters parameters) async{
    return await repository.getNowPlayingMovies();
  }





}