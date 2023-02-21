import 'package:dartz/dartz.dart';
import 'package:movie_tv_app_clean_arch/core/usecase/base_usecase.dart';
import 'package:movie_tv_app_clean_arch/movies/domain/entities/movie.dart';
import 'package:movie_tv_app_clean_arch/movies/domain/repository/base_movie_repository.dart';

import '../../../core/error/failure.dart';

class GetNowPlayingMoviesUseCase
    extends BaseUseCase<List<Movie>, NoParameters> {
  final BaseMovieRepository baseMovieRepository;

  GetNowPlayingMoviesUseCase(this.baseMovieRepository);

  @override
  Future<Either<Failure, List<Movie>>> call(NoParameters parameters) async {
    return await baseMovieRepository.getNowPlayingMovies();
  }
}
