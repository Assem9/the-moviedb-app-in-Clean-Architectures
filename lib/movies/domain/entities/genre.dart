import 'package:equatable/equatable.dart';

class Genre extends Equatable{
  final String name ;
  final int id  ;

  const Genre(this.name, this.id);

  @override
  // TODO: implement props
  List<Object?> get props => [name, id];

}