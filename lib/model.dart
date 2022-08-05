import 'package:cloud_firestore/cloud_firestore.dart';

class NotesModel {
  String? docId;
  String? attachment;

  NotesModel(
      {this.docId, this.attachment});

  NotesModel.fromMap(DocumentSnapshot data) {
    docId = data.id;
    attachment = data['attachment'];
  }
}
