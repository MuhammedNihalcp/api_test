import 'dart:developer';

import 'package:api/model.dart';
import 'package:api/service.dart';
import 'package:api/service_2.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import 'model_2.dart';

class ApiController extends GetxController {
  List<ApiModel> list = [];
  List<ApiModel2> list2 = [];
  int count = 0;
  int count2 = 0;
  void get() {
    Api().display().then((value) {
      if (value != null) {
        list = value;
        update();
        count = 0;
        update();
        Future.forEach(list, (ApiModel api) {
          if (api.category == Category.JEWELERY) {
            log('1');
            count += 1;
          }
        });
      } else {
        log('null');
      }
    });
  }

  void get2(int index) {
    Api2().display2().then((value) {
      if (value != null) {
        list2 = value;
        update();
        log(list2[index].category.name.toString());
        log(list2.length.toString());
        // log(list2[index].category.name.toString().length.toString());
        count2 = 0;
        update();
        Future.forEach(list2, (ApiModel2 api2) {
          if (api2.category.name == Name.SHOES) {
            log('1');
            count2 += 1;
          }
        });

        log(count2.toString(), name: 'category name clothes');
      } else {
        log('null');
      }
    });
  }
}
