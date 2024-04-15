import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_advanced/Breaking_bad/data/Model/charachter.dart';
import 'package:flutter_advanced/core/constant.dart';
import 'package:logger/logger.dart';
import 'package:http/http.dart' as http;

Logger logger = Logger();

abstract class RemouteDataSource {
  Future<List<dynamic>> getData();
}

class RemouteDataSourceHttp implements RemouteDataSource {
  late List<CharachterModel> models;

  getData() async {
    try {
      logger.i("Start Connecction to http ");
      final response = await http.get(Uri.parse(baseurl));
      logger.i("get Response from http");

      var data = json.decode(response.body);

      return data["results"];
    } catch (e, s) {
      logger.e("stack erorr is $s");
      rethrow;
    }
  }
}

class RemouteDataSourceDio implements RemouteDataSource {
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

  getData() async {
    try {
      final response = await dio.get("character");
      logger.i("Success getfrom api");
      // var   data=jsonDecode(response.data);
      print(response.data.toString());
      return response.data["results"];
    } catch (e, s) {
      logger.e("Remoute ${s}");
      return [];
    }
  }
}
