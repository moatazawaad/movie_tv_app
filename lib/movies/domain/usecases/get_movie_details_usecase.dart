import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_tv_app_clean_arch/core/error/failure.dart';
import 'package:movie_tv_app_clean_arch/core/usecase/base_usecase.dart';
import 'package:movie_tv_app_clean_arch/movies/domain/entities/movie_details.dart';
import 'package:movie_tv_app_clean_arch/movies/domain/repository/base_movie_repository.dart';

class GetMovieDetailsUseCase
    extends BaseUseCase<MovieDetails, MovieDetailsParameters> {
  final BaseMovieRepository baseMovieRepository;

  GetMovieDetailsUseCase(this.baseMovieRepository);

  @override
  Future<Either<Failure, MovieDetails>> call(
      MovieDetailsParameters parameters) async {
    return await baseMovieRepository.getMovieDetails(parameters);
  }
}

class MovieDetailsParameters extends Equatable {
  final int movieId;

  const MovieDetailsParameters({required this.movieId});

  @override
  // TODO: implement props
  List<Object?> get props => [movieId];
}
