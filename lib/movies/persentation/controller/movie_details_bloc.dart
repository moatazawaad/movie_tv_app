import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_tv_app_clean_arch/core/utils/enums.dart';
import 'package:movie_tv_app_clean_arch/movies/domain/entities/movie_details.dart';
import 'package:movie_tv_app_clean_arch/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:movie_tv_app_clean_arch/movies/domain/usecases/get_movie_recommendation_usecase.dart';

import '../../domain/entities/movie_recommendation.dart';

part 'movie_details_event.dart';

part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  MovieDetailsBloc(this.getMovieDetailsUseCase, this.getRecommendationUseCase)
      : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);

    on<GetMovieRecommendationEvent>(_getMovieRecommendation);
  }

  final GetMovieDetailsUseCase getMovieDetailsUseCase;
  final GetRecommendationUseCase getRecommendationUseCase;

  FutureOr<void> _getMovieDetails(
      GetMovieDetailsEvent event, Emitter<MovieDetailsState> emit) async {
    final result =
        await getMovieDetailsUseCase(MovieDetailsParameters(movieId: event.id));

    result.fold(
        (l) => emit(state.copyWith(
            movieDetailsState: RequestState.error,
            movieDetailsMessage: l.message)),
        (r) => emit(
              state.copyWith(
                  movieDetails: r, movieDetailsState: RequestState.loaded),
            ));
  }

  FutureOr<void> _getMovieRecommendation(GetMovieRecommendationEvent event,
      Emitter<MovieDetailsState> emit) async {
    final result =
        await getRecommendationUseCase(RecommendationParameters(event.id));

    result.fold(
        (l) => emit(state.copyWith(
            recommendationState: RequestState.error,
            recommendationMessage: l.message)),
        (r) => emit(
              state.copyWith(
                  recommendation: r, recommendationState: RequestState.loaded),
            ));
  }
}
