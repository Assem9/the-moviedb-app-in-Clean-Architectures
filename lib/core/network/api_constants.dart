class ApiConstants{
  static const String baseUrl = 'https://api.themoviedb.org/3';
  static const String apiKey = '63c65f09ee62449f6260d7dea59ace58';
  static const String nowPlayingMoviesPath = '$baseUrl/movie/now_playing?api_key=$apiKey';
  static const String popularMoviesPath = '$baseUrl/movie/popular?api_key=$apiKey';
  static const String topRatedMoviesPath = '$baseUrl/movie/top_rated?api_key=$apiKey';
  static const String baseImageUrl = 'https://image.tmdb.org/t/p/w500';
  static  String movieDetailsPath (int id)=> '$baseUrl/movie/$id?api_key=$apiKey';
  static  String movieRecommendationsPath (int movieId)=>
      '$baseUrl/movie/$movieId/recommendations?api_key=$apiKey';
  static String imageUrl(String path)=> '$baseImageUrl$path';

}