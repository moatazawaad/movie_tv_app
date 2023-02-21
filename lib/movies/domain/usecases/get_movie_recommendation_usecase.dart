import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_tv_app_clean_arch/core/error/failure.dart';
import 'package:movie_tv_app_clean_arch/core/usecase/base_usecase.dart';
import 'package:movie_tv_app_clean_arch/movies/domain/entities/movie_recommendation.dart';
import 'package:movie_tv_app_clean_arch/movies/domain/repository/base_movie_repository.dart';

class GetRecommendationUseCase
    extends BaseUseCase<List<Recommendation>, RecommendationParameters> {
  final BaseMovieRepository baseMovieRepository;

  GetRecommendationUseCase(this.baseMovieRepository);

  @override
  Future<Either<Failure, List<Recommendation>>> call(
      RecommendationParameters parameters) async {
    return await baseMovieRepository.getRecommendation(parameters);
  }
}

class RecommendationParameters extends Equatable {
  final int id;

  const RecommendationParameters(this.id);

  @override
  // TODO: implement props
  List<Object?> get props => [id];
}
