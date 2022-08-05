import 'dart:developer';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:open_file/open_file.dart';

import 'controller.dart';
import 'new.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  void Images() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(type: FileType.image);

    if (result != null) {
      PlatformFile file = result.files.first;
      log("message:-${file.name}");
      _openFile(file);
    } else {
      // User canceled the picker
    }
  }

  void _openFile(PlatformFile file) {
    OpenFile.open(file.path);
  }

  @override
  AddNewNoteController addNewNoteController = Get.put(AddNewNoteController());
  Transition fade = Transition.fadeIn;

  @override
  Widget build(BuildContext context) {
    var data = Get.arguments;
    if (data != null) {
      addNewNoteController.docId = data.docId;
      log(data.attachment.toString());
      if (data.attachment.toString().isNotEmpty) {
        log("Hello");
        addNewNoteController.isFileGet.value = true;
        addNewNoteController.imagePath.value = data.attachment;
      } else {
        log("Not Hello");
        addNewNoteController.isFileGet.value = false;
        // addNewNoteController.imagePath.value = '';
      }
    }
    return Scaffold(
        appBar: AppBar(
          title: GestureDetector(
              onTap: () {
                addNewNoteController.getFromGallery();
              },
              child: const Text("Image Firebase Add")),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 15),
              child: Row(
                children: [
                  GestureDetector(
                      onTap: () {
                        Get.to(NewData());
                      },
                      child: const Icon(Icons.image)),
                ],
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // if (data != null) {
            //   addNewNoteController.updateNotes(
            //     addNewNoteController.docId,
            //     addNewNoteController.imagePath.isNotEmpty
            //         ? addNewNoteController.imagePath.value
            //         : '',
            //   );
            //   // Get.offNamed(Routes.home);
            // } else {
            if (addNewNoteController.imagePath.value.isNotEmpty) {
              addNewNoteController
                  .addNotes(addNewNoteController.imagePath.value);
              Fluttertoast.showToast(
                  msg: "Save",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  fontSize: 14);
            } else {
              Get.snackbar('Add some input',
                  'Both title and description can not be empty',
                  duration: const Duration(seconds: 2),
                  snackPosition: SnackPosition.BOTTOM,
                  margin: const EdgeInsets.symmetric(vertical: 2));
            }
            // }
          },
          tooltip: "AppString.add",
          child: const Icon(Icons.done),
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 150),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                child: Obx(
                  () => Container(
                    color: Colors.grey,
                    child: addNewNoteController.isFileGet.value &&
                            addNewNoteController.imagePath.value != ''
                        ? Padding(
                            padding: const EdgeInsets.only(bottom: 0),
                            child: Align(
                              alignment: Alignment.bottomLeft,
                              child: Stack(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      addNewNoteController.getFromGallery();
                                    },
                                    child: Hero(
                                      tag: 'imageHero',
                                      child: Image.file(
                                        File(addNewNoteController.imagePath
                                            .toString()),
                                        height: 300,
                                        width: double.infinity,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        : SizedBox(),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
