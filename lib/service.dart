import 'dart:developer';

import 'package:api/model.dart';
import 'package:dio/dio.dart';

class Api {
  final url = 'https://fakest oreapi.com/products';
  final dio = Dio();
  Future<List<ApiModel>?> display() async {
    try {
      log('tryil keri');
      Response resposnce = await dio.get(url);
      log('response kyichu');
      log(resposnce.statusCode.toString(), name: 'status code');
      if (resposnce.statusCode == 200 || resposnce.statusCode == 201) {
        log(resposnce.data.toString());
        List<ApiModel> getapi = (resposnce.data as List).map((e) {
          return ApiModel.fromJson(e);
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
