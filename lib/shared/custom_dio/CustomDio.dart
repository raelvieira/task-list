import 'package:dio/dio.dart';

import 'CustomInterceptors.dart';

class CustomDio extends Dio {
  CustomDio() {
    options.baseUrl = 'http://10.0.2.2:9001/Gateway/';
    interceptors.add(CustomInterceptors());
    options.connectTimeout = 10000;
  }
}