import 'package:flutter_advanced/Breaking_bad/data/Model/charachter.dart';
import 'package:flutter_advanced/Breaking_bad/data/datasource/remouteDatasourcee.dart';
import 'package:logger/logger.dart';

Logger logger = Logger();

class CharacterRepo {
  List<CharachterModel> models=[];
  final RemouteDataSourceImp remouteDataSource;
   CharacterRepo({required this.remouteDataSource});
  Future<List<CharachterModel>> getData() async {
    try {
            logger.i("Start Repo");

      List data = await remouteDataSource.getDataFromHttp();
       models = data
          .map<CharachterModel>((e) => CharachterModel.fromJson(e))
          .toList();
      logger.i("End Repo");logger.i("Type of List Model is  ${models[1]}");
      return models;
    } catch (e) {
      logger.e("Repo ${e.runtimeType}");
      return [];
    }
  }
}
