
import 'package:flutter_advanced/Breaking_bad/data/Repositry/repositry.dart';
import 'package:flutter_advanced/Breaking_bad/data/datasource/remouteDatasourcee.dart';
import 'package:get_it/get_it.dart';

class DependencyInjection{
  static final sl=GetIt.instance;
  static Future<void>  init()async{

   sl.registerFactory<RemouteDataSource>(() => RemouteDataSourceImp());
   sl.registerFactory<CharacterRepo>(() => CharacterRepo(remouteDataSource: RemouteDataSourceImp()));

  }
}