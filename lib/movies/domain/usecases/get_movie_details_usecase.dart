import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/failuer.dart';
import 'package:movies_app/core/usecase/base_usecase.dart';
import 'package:movies_app/movies/domain/entities/movie_details.dart';
import 'package:movies_app/movies/domain/repository/base_movie_repository.dart';

class GetMovieDetailsUseCase extends BaseUseCase<MovieDetails,int>{
  final BaseMoviesRepository moviesRepository ;

  GetMovieDetailsUseCase(this.moviesRepository);
  @override
  Future<Either<Failure, MovieDetails>> call(int parameters) async{
    return await moviesRepository.getMovieDetails(parameters);
  }

}