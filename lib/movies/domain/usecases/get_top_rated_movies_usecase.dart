import 'package:dartz/dartz.dart';
import '../../../core/error/failuer.dart';
import '../../../core/usecase/base_usecase.dart';
import '../entities/movie.dart';
import '../repository/base_movie_repository.dart';

class GetTopRatedMoviesUseCase extends BaseUseCase<List<Movie>,NoParameters>{
  final BaseMoviesRepository repository ;
  GetTopRatedMoviesUseCase(this.repository);

  @override
  Future<Either<Failure, List<Movie>>> call(NoParameters parameters) async{
    return await repository.getTopRatedMovies();
  }


}