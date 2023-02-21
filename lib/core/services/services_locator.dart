import 'package:get_it/get_it.dart';
import 'package:movie_tv_app_clean_arch/movies/data/datasources/movies_remote_data_source.dart';
import 'package:movie_tv_app_clean_arch/movies/data/repository/movies_repository.dart';
import 'package:movie_tv_app_clean_arch/movies/domain/repository/base_movie_repository.dart';
import 'package:movie_tv_app_clean_arch/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:movie_tv_app_clean_arch/movies/domain/usecases/get_movie_recommendation_usecase.dart';
import 'package:movie_tv_app_clean_arch/movies/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:movie_tv_app_clean_arch/movies/domain/usecases/get_popular_movie_usecase.dart';
import 'package:movie_tv_app_clean_arch/movies/domain/usecases/get_top_rated_movie_usecase.dart';
import 'package:movie_tv_app_clean_arch/movies/persentation/controller/movie_bloc.dart';
import 'package:movie_tv_app_clean_arch/movies/persentation/controller/movie_details_bloc.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    /// Bloc
    sl.registerLazySingleton(() => MovieBloc(sl(), sl(), sl()));
    sl.registerLazySingleton(() => MovieDetailsBloc(sl(), sl()));

    /// Use Cases
    sl.registerLazySingleton(() => GetNowPlayingMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetPopularMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetTopRatedMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetMovieDetailsUseCase(sl()));
    sl.registerLazySingleton(() => GetRecommendationUseCase(sl()));

    /// Repository
    sl.registerLazySingleton<BaseMovieRepository>(() => MoviesRepository(sl()));

    /// Data Source
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(
        () => MovieRemoteDataSource());
  }
}
