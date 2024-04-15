import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_advanced/Breaking_bad/data/Model/charachter.dart';
import 'package:flutter_advanced/core/constant.dart';
import 'package:logger/logger.dart';
import 'package:http/http.dart' as http;

Logger logger = Logger();

abstract class RemouteDataSource {
  Future<List<dynamic>> getDataFromDio();
  Future<List<dynamic>> getDataFromHttp();
}

class RemouteDataSourceImp implements RemouteDataSource {
  
  late Dio dio;

  RemouteDataSourceImp() {
    BaseOptions baseOptions = BaseOptions(
        baseUrl: baseurl,
        connectTimeout: const Duration(seconds: 60),
        receiveTimeout: const Duration(seconds: 60),
        receiveDataWhenStatusError: true);
    dio = Dio(
      baseOptions,
    );
  }
  getDataFromHttp() async {
    try {
      logger.i("Start Connecction to http ");
      final response = await http.get(Uri.parse(baseurl));
      var data = json.decode(response.body);
      logger.i("End Connecction to http ");
      return data["results"];
    } catch (e, s) {
      logger.e("stack erorr is $s");
      rethrow;
    }
  }

  getDataFromDio() async {
    try {
      final response = await dio.get("character");
      logger.i("Success getfrom api");
      print(response.data.toString());
      return response.data["results"];
    } catch (e, s) {
      logger.e("Remoute ${s}");
      return [];
    }
  }
}
