import 'package:flutter_advanced/Breaking_bad/data/Model/charachter.dart';
import 'package:flutter_advanced/Breaking_bad/data/datasource/remouteDatasourcee.dart';
import 'package:logger/logger.dart';

Logger logger = Logger();

class CharacterRepo {
  final RemouteDataSourceImp remouteDataSource;
  const CharacterRepo({required this.remouteDataSource});
  Future<List<CharachterModel>> getData() async {
    try {
            logger.i("Start Repo");

      List data = await remouteDataSource.getDataFromHttp();
      List<CharachterModel> models = data
          .map<CharachterModel>((e) => CharachterModel.fromJson(e))
          .toList();
      logger.i("Start Repo");
      
      return models;
    } catch (e) {
      logger.e("Repo ${e.runtimeType}");
      return [];
    }
  }
}
