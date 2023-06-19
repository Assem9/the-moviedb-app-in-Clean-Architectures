import 'package:equatable/equatable.dart';

class Movie extends Equatable{
  final int id;
  final String title;
  final String backdropPath;
  final List<int> genreIds ;
  final String overView ;
  final double voteAverage;
  final String releaseData;

  const Movie({
    required this.id,
    required this.title,
    required this.backdropPath,
    required this.genreIds,
    required this.overView,
    required this.voteAverage,
    required this.releaseData,
  });

  @override
  List<Object?> get props =>[id,title,backdropPath,genreIds,overView,voteAverage,releaseData];

}