import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collegeproject/services/Models/StudentModel.dart';

class StudentFirestore {
  // Add user to database ---------------------
  Future<void> createUser({
    required String name,
    required String enrollmentNumber,
    required String branch,
  }) async {
    final docUser =
        FirebaseFirestore.instance.collection('Students').doc();

    final user = StudentsModel(
      name: name,
      enrollmentNumber: enrollmentNumber,
      branch: branch,
      id: docUser.id,
    ).toJson();

    docUser.set(user);
  }

  // Retrieve user from database ---------------------

  Future getUser() async {
    final docUser = await FirebaseFirestore.instance
        .collection('Students')
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => StudentsModel.fromJson(doc.data()))
            .toList());
  }
}
