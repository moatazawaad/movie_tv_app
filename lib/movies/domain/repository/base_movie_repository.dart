import 'package:dartz/dartz.dart';
import 'package:movie_tv_app_clean_arch/movies/domain/entities/movie_details.dart';
import 'package:movie_tv_app_clean_arch/movies/domain/entities/movie_recommendation.dart';
import 'package:movie_tv_app_clean_arch/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:movie_tv_app_clean_arch/movies/domain/usecases/get_movie_recommendation_usecase.dart';

import '../../../core/error/failure.dart';
import '../entities/movie.dart';

abstract class BaseMovieRepository {
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies();

  Future<Either<Failure, List<Movie>>> getTopRatedMovies();

  Future<Either<Failure, List<Movie>>> getPopularMovies();

  Future<Either<Failure, MovieDetails>> getMovieDetails(
      MovieDetailsParameters parameters);

  Future<Either<Failure, List<Recommendation>>> getRecommendation(
      RecommendationParameters parameters);
}
