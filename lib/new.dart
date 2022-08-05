import 'dart:developer';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_database/home_controller.dart';
import 'package:image_database/routes.dart';

class NewData extends StatelessWidget {
   NewData({Key? key}) : super(key: key);
  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
        body: Obx(
              () => Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: GridView.builder(
                  itemCount: homeController.allData.length,
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    mainAxisExtent: 110,
                    maxCrossAxisExtent: 110,
                    childAspectRatio: 3 / 2,
                    crossAxisSpacing: 14,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (_, index) {
                    return Container(
                      decoration: BoxDecoration(
                        border: Border.all(width: 2)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Image.file(
                          File(homeController.allData[index].attachment.toString()),
                          height: 100,
                          width: double.infinity,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),);
  }
}
