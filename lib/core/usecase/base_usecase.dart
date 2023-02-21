import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_tv_app_clean_arch/core/error/failure.dart';

abstract class BaseUseCase<T, Parameters> {
  Future<Either<Failure, T>> call(Parameters parameters);
}

class NoParameters extends Equatable {
  const NoParameters();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}