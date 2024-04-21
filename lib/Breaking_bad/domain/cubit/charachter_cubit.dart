import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_advanced/Breaking_bad/data/Model/charachter.dart';
import 'package:flutter_advanced/Breaking_bad/data/Repositry/repositry.dart';
import 'package:meta/meta.dart';

part 'charachter_state.dart';

class CharachterCubit extends Cubit<CharachterState> {
  final CharacterRepo repo;
  List<CharachterModel> mymodeles = [];
  CharachterCubit(this.repo) : super(CharachterLoading());

   getData()  {
              emit(CharachterLoading());

    logger.i("Start Cubit");
    try{
      repo.getData().then((value) {
      mymodeles = value; //print("$value");
          emit(CharachterLoaded(modeles: mymodeles));});

    }catch(e,s){
      emit(CharachterErorr(message: "Erorr get Data"));
          logger.e("Erorr is $s");

    }
    logger.i("End Cubit");
  }
}
