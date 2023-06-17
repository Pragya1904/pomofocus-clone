import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService{
  final CollectionReference taskCollection=FirebaseFirestore.instance.collection("tasks");
  final String uid="dummyuid";
  Future updateUserData(String taskName,String estPomo)async{
    return await taskCollection.doc(uid).set({
      'taskName': taskName,
      'estPomo':estPomo
    });
  }

  Stream<QuerySnapshot>get tasks{
    return taskCollection.snapshots();
  }
}