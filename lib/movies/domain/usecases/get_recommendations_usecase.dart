import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/error/failuer.dart';
import 'package:movies_app/core/usecase/base_usecase.dart';
import 'package:movies_app/movies/domain/entities/recommendation.dart';
import 'package:movies_app/movies/domain/repository/base_movie_repository.dart';

class GetRecommendationsUseCase extends BaseUseCase<List<Recommendation>, RecommendationParameters> {

  final BaseMoviesRepository moviesRepository ;

  GetRecommendationsUseCase(this.moviesRepository);

  @override
  Future<Either<Failure, List<Recommendation>>> call(RecommendationParameters parameters) async{
    return await moviesRepository.getMovieRecommendations(parameters.id);
  }


}

class RecommendationParameters extends Equatable {
  final int id;

  const RecommendationParameters(this.id);

  @override
  List<Object> get props => [id];
}