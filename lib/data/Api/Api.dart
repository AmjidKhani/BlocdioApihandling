import 'package:dio/dio.dart';
import 'package:flutter_pretty_dio_logger/flutter_pretty_dio_logger.dart';

class Api{
   Dio _dio =Dio();
  Api(){
    _dio.options.baseUrl="https://jsonplaceholder.typicode.com";
    _dio.interceptors.add(PrettyDioLogger());
  }
  Dio get sendPost=>_dio;
}