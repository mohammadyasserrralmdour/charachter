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
    List<CharachterModel> e = await repo.getData();
    emit(CharachterLoaded(modeles: e));
    logger.i("Start equal");

    mymodeles = e;

    logger.i("End Cubit");

    return e;
  }
}
