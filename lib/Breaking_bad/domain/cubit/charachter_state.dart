part of 'charachter_cubit.dart';

@immutable
sealed class CharachterState extends Equatable{}

final class CharachterInitial extends CharachterState{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

final class CharachterLoading extends CharachterState {
  @override
 
  List<Object?> get props => [];
}


final class CharachterLoaded extends CharachterState {
  final List<CharachterModel> modeles;

  CharachterLoaded({required this.modeles});
  
  @override
  // TODO: implement props
  List<Object?> get props => [];
  
}


final class CharachterErorr extends CharachterState {
  final String message;

  CharachterErorr({required this.message});
  
  @override
  List<Object?> get props =>  [message];
}

