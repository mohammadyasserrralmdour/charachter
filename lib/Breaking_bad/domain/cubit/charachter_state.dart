part of 'charachter_cubit.dart';

@immutable
sealed class CharachterState {}


final class CharachterLoading extends CharachterState {}


final class CharachterLoaded extends CharachterState {
  final List<CharachterModel> modeles;

  CharachterLoaded({required this.modeles});
  
}


final class CharachterErorr extends CharachterState {
  final String message;

  CharachterErorr({required this.message});
}

