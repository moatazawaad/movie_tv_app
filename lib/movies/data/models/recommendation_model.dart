import 'package:movie_tv_app_clean_arch/movies/domain/entities/movie_recommendation.dart';

class RecommendationModel extends Recommendation {
  const RecommendationModel({super.backdropPath, required super.id});

  factory RecommendationModel.fromJson(Map<String, dynamic> json) =>
      RecommendationModel(
          backdropPath:
              json["backdrop_path"] ?? '/aTovumsNlDjof7YVoU5nW2RHaYn.jpg',
          id: json["id"]);
}
