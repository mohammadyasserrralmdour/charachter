import 'package:dio/dio.dart';
import 'package:flutter_advanced/core/constant.dart';
import 'package:logger/logger.dart';

Logger logger=Logger(); 

class RemouteDataSource {
  late Dio dio;
  RemouteDataSource() {
    BaseOptions baseOptions = BaseOptions(
        baseUrl: baseurl,
        connectTimeout: const Duration(seconds: 60),
        receiveTimeout: const Duration(seconds: 60),
        
        receiveDataWhenStatusError: true);
    dio = Dio(
      baseOptions,
    );
  }

  Future<List<dynamic>> getData()async{
    try{
      final response=await dio.get("character");
       logger.i("Success getfrom api");
   // var   data=jsonDecode(response.data);
   print(response.data.toString());
      return response.data["results"];
    }catch(e,s){  
     logger.e("Remoute ${s}");
      return [];
          }
  }
}