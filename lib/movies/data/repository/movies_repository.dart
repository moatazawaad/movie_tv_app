import 'package:dartz/dartz.dart';
import 'package:movie_tv_app_clean_arch/core/error/exceptions.dart';
import 'package:movie_tv_app_clean_arch/core/error/failure.dart';
import 'package:movie_tv_app_clean_arch/movies/domain/entities/movie.dart';
import 'package:movie_tv_app_clean_arch/movies/domain/entities/movie_details.dart';
import 'package:movie_tv_app_clean_arch/movies/domain/entities/movie_recommendation.dart';
import 'package:movie_tv_app_clean_arch/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:movie_tv_app_clean_arch/movies/domain/usecases/get_movie_recommendation_usecase.dart';
import '../../domain/repository/base_movie_repository.dart';
import '../datasources/movies_remote_data_source.dart';

class MoviesRepository extends BaseMovieRepository {
  final BaseMovieRemoteDataSource baseMovieRemoteDataSource;
  MoviesRepository(this.baseMovieRemoteDataSource);

  @override
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies() async {
    final result = await baseMovieRemoteDataSource.getNowPlayingMovie();

    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies() async {
    final result = await baseMovieRemoteDataSource.getPopularMovie();

    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRatedMovies() async {
    final result = await baseMovieRemoteDataSource.getTopRatedMovies();

    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, MovieDetails>> getMovieDetails(
      MovieDetailsParameters parameters) async {
    final result = await baseMovieRemoteDataSource.getMovieDetails(parameters);

    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Recommendation>>> getRecommendation(
      RecommendationParameters parameters) async {
    final result =
        await baseMovieRemoteDataSource.getRecommendation(parameters);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }
}
