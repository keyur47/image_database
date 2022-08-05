import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'model.dart';

class HomeController extends GetxController {
  RxList<NotesModel> allData = <NotesModel>[].obs;
  RxBool logOutLoading = false.obs;
  RxBool longPress = false.obs;
  RxBool isAllAdded = false.obs;
  RxList selectedItems = [].obs;

  @override
  onInit() {
    super.onInit();
    allData.bindStream(getNoteData());
  }


  ///retrieve data from cloud fireStore
  Stream<List<NotesModel>> getNoteData() {
    return FirebaseFirestore.instance
        .collection("Notes")
        .snapshots()
        .map(
          (event) =>
          event.docs.map((item) => NotesModel.fromMap(item)).toList(),
    );
  }

  ///Delete From Firebase
  Future<void> deleteRecords() async {
    FirebaseFirestore.instance
        .collection("Notes")
        .doc(selectedItems.toString())
        .delete()
        .then((value) {
      log("message---$selectedItems");
      Get.snackbar("Record Delete", "Record has been deleted successfully",
          duration: const Duration(seconds: 2),
          snackPosition: SnackPosition.BOTTOM,
          margin: EdgeInsets.symmetric(vertical: 2));
      // getSnackBar("Record Delete", "Record has been deleted successfully",
      //     Colors.red.shade500, 2);
    });
  }

  ///Delete Multiple Records From Firebase
  Future<void> batchDelete() async {
    WriteBatch batch = FirebaseFirestore.instance.batch();

    for (String id in selectedItems) {
      DocumentReference ref =
      FirebaseFirestore.instance.collection("Notes").doc(id);
      batch.delete(ref);
    }

    batch.commit();
  }

}
