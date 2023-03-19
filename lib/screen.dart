import 'package:api/controller.dart';
import 'package:api/service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class ScreenHome extends StatelessWidget {
  ScreenHome({super.key});

  final apiC = Get.put(ApiController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: GetBuilder<ApiController>(
            builder: (controller) => ListView.separated(
                itemBuilder: (context, index) {
                  return TextButton(
                      onPressed: () {
                        apiC.get2(index);
                      },
                      child: Text('display'));
                },
                separatorBuilder: (context, index) {
                  return Divider();
                },
                itemCount: 1)),
      )),
    );
  }
}
