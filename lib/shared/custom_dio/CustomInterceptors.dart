import 'dart:io';

import 'package:dio/dio.dart';

import '../../app/app_module.dart';
import 'CustomDio.dart';

class CustomInterceptors extends InterceptorsWrapper {

  @override
  Future onRequest(RequestOptions options) async {
    options.contentType = ContentType.parse('application/json;charset=UTF-8');
  }

  @override
  Future onError(DioError error) {
    if(error.response?.statusCode == 401) {
      //CustomDio dio = AppModule.to.getDependency<CustomDio>();
    }
  }

  @override
  Future onResponse(Response response) {
  }
}