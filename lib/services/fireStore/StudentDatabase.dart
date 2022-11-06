import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collegeproject/services/Models/StudentModel.dart';
import 'package:collegeproject/services/Models/schoolEntryModel.dart';
import 'package:collegeproject/services/Models/studentEntryModel.dart';
import 'package:firebase_core/firebase_core.dart';

class StudentDatabase {
  // Add user to database ---------------------
  Future<void> createUser({
    required String name,
    required String enrollmentNumber,
    required String branch,
  }) async {
    final docUser = FirebaseFirestore.instance.collection('Students').doc();

    final user = StudentsModel(
      name: name,
      enrollmentNumber: enrollmentNumber,
      branch: branch,
      id: docUser.id,
    ).toJson();

    docUser.set(user);
  }

  Future<void> studentEntry({
    required String name,
    required String mobile,
    required String school,
    required String state,
    required String city,
    required String stream,
  }) async {
    final studentEntry =
        FirebaseFirestore.instance.collection('studentEntry').doc();

    final user = StudentEntryModel(
      id: studentEntry.id,
      name: name,
      mobile: mobile,
      school: school,
      state: state,
      city: city,
      stream: stream,
    ).toJson();

    studentEntry.set(user);
  }

  Future<void> schoolEntry({
    required school,
    required state,
    required zone,
    required team,
    required schoolType,
    required city,
    required area,
    required staffName,
  }) async {
    final schoolEntry =
        FirebaseFirestore.instance.collection('schoolEntry').doc();
    final user = SchoolEntryModel(
      id: schoolEntry.id,
      school: school,
      state: state,
      zone: zone,
      team: team,
      schoolType: schoolType,
      city: city,
      area: area,
      staffName: staffName,
    ).toJson();

    schoolEntry.set(user);
  }

  Future getUser() async {
    await FirebaseFirestore.instance.collection('studentEntry').snapshots().map(
        (snapshot) => snapshot.docs
            .map((doc) => StudentsModel.fromJson(doc.data()))
            .toList());
  }
}
