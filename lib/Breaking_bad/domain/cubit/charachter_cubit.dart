import 'package:bloc/bloc.dart';
import 'package:flutter_advanced/Breaking_bad/data/Model/charachter.dart';
import 'package:flutter_advanced/Breaking_bad/data/Repositry/repositry.dart';
import 'package:meta/meta.dart';

part 'charachter_state.dart';

class CharachterCubit extends Cubit<CharachterState> {
  final CharacterRepo repo;
  List<CharachterModel> mymodeles = [];
  CharachterCubit(this.repo) : super(CharachterLoading());

  Future<List<CharachterModel>> getData() async {
    logger.i("Start Cubit");
    mymodeles = await repo.getData();

   //  emit(CharachterErorr(message: "Erorr"));

    logger.i("End Cubit");
     //  emit(CharachterLoaded(modeles: mymodeles));

    return mymodeles;
  }
}
