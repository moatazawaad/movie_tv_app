import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:movie_tv_app_clean_arch/core/usecase/base_usecase.dart';
import 'package:movie_tv_app_clean_arch/core/utils/enums.dart';
import 'package:movie_tv_app_clean_arch/movies/domain/usecases/get_popular_movie_usecase.dart';
import 'package:movie_tv_app_clean_arch/movies/persentation/controller/movie_event.dart';
import 'package:movie_tv_app_clean_arch/movies/persentation/controller/movie_state.dart';
import '../../domain/usecases/get_now_playing_movies_usecase.dart';
import '../../domain/usecases/get_top_rated_movie_usecase.dart';

class MovieBloc extends Bloc<MoviesEvents, MoviesState> {
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;

  MovieBloc(this.getNowPlayingMoviesUseCase, this.getPopularMoviesUseCase,
      this.getTopRatedMoviesUseCase)
      : super(const MoviesState()) {
    // on to call event
    on<GetNowPlayingMovieEvent>(_getNowPlayingMovies);

    on<GetPopularMovieEvent>(_getPopularMovies);

    on<GetTopRatedMovieEvent>(_getTopRatedMovies);
  }

  FutureOr<void> _getNowPlayingMovies(
      GetNowPlayingMovieEvent event, Emitter<MoviesState> emit) async {
    final result = await getNowPlayingMoviesUseCase(const NoParameters());

    result.fold(
      (l) => emit(state.copyWith(
        nowPlayingState: RequestState.error,
        nowPlayingMessage: l.message,
      )),
      (r) => emit(
        state.copyWith(
          nowPlayingMovies: r,
          nowPlayingState: RequestState.loaded,
        ),
      ),
    );
  }

  FutureOr<void> _getPopularMovies(
      GetPopularMovieEvent event, Emitter<MoviesState> emit) async {
    final result = await getPopularMoviesUseCase(const NoParameters());

    result.fold(
      (l) => emit(state.copyWith(
        popularState: RequestState.error,
        popularMessage: l.message,
      )),
      (r) => emit(
        state.copyWith(
          popularMovies: r,
          popularState: RequestState.loaded,
        ),
      ),
    );
  }

  FutureOr<void> _getTopRatedMovies(
      GetTopRatedMovieEvent event, Emitter<MoviesState> emit) async {
    final result = await getTopRatedMoviesUseCase(const NoParameters());

    result.fold(
      (l) => emit(state.copyWith(
        topRatedState: RequestState.error,
        topRatedMessage: l.message,
      )),
      (r) => emit(
        state.copyWith(
          topRatedMovies: r,
          topRatedState: RequestState.loaded,
        ),
      ),
    );
  }
}
