import 'dart:developer';

import 'package:api/model.dart';
import 'package:dio/dio.dart';

import 'model_2.dart';

class Api2 {
  final url = 'https://api.escuelajs.co/api/v1/products';
  final dio = Dio();
  Future<List<ApiModel2>?> display2() async {
    try {
      log('tryil keri');
      Response resposnce = await dio.get(url);
      log('response kyichu');
      log(resposnce.statusCode.toString(), name: 'status code');
      if (resposnce.statusCode == 200 || resposnce.statusCode == 201) {
        log(resposnce.data.toString());
        List<ApiModel2> getapi = (resposnce.data as List).map((e) {
          return ApiModel2.fromJson(e);
        }).toList();
        return getapi;
      }
      return null;
    } on DioError catch (e) {
      log(e.message.toString(), name: 'DioError');
    }
    return null;
  }
}
