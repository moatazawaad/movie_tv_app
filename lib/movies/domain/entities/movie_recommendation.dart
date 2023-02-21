import 'package:equatable/equatable.dart';

class Recommendation extends Equatable {
  final String? backdropPath;
  final int id;

  const Recommendation({this.backdropPath, required this.id});

  @override
  // TODO: implement props
  List<Object?> get props => [backdropPath, id];
}
