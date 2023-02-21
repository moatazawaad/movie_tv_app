class ApiConstance {
  static const String baseUrl = "https://api.themoviedb.org/3";

  static const String apiKey = '9d2452a3a5677d088b06cf7fa49b2e59';

  static const String nowPlayingMovie =
      "$baseUrl/movie/now_playing?api_key=$apiKey";

  static const String popularMovie = "$baseUrl/movie/popular?api_key=$apiKey";

  static const String topRatedMovie =
      "$baseUrl/movie/top_rated?api_key=$apiKey";

  static String movieDetails(int movieId) =>
      "$baseUrl/movie/$movieId?api_key=$apiKey";

  static String recommendation(int movieId) =>
      "$baseUrl/movie/$movieId/recommendations?api_key=$apiKey";

  static const String baseImageUrl = "https://image.tmdb.org/t/p/w500";

  static String imageUrl(String path) => '$baseImageUrl$path';
}
