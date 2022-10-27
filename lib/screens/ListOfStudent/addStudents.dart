// ignore_for_file: prefer_const_constructors

import 'package:collegeproject/screens/ListOfStudent/listofstudent.dart';
import 'package:collegeproject/services/fireStore/StudentFirestore.dart';
import 'package:collegeproject/utils/constants.dart';
import 'package:collegeproject/utils/showSnackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AddStudents extends StatefulWidget {
  const AddStudents({super.key});

  @override
  State<AddStudents> createState() => _AddStudentsState();
}

class _AddStudentsState extends State<AddStudents> {
  static final GlobalKey<FormState> studentformkey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController enrollmentController = TextEditingController();

  final StudentFirestore user = StudentFirestore();

  final List<String> branchList = ['CSE', 'EC', 'EX', 'IT'];

  String _selectedItem = 'CSE';

  void clearEntries() {
    // to clear records after submittion
    nameController.clear();
    enrollmentController.clear();
  }

  @override
  void dispose() {
    nameController.dispose();
    enrollmentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Add Students',
          style: TextStyle(
            color: Colors.black54,
            fontWeight: FontWeight.w500,
            fontSize: 16.0,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Form(
            key: studentformkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderSide: BorderSide()),
                    hintText: 'Enter your name',
                    hintStyle: TextStyle(color: Colors.grey),
                    labelText: 'Name',
                    labelStyle: TextStyle(color: Colors.grey),
                    prefixIcon: Icon(
                      Icons.edit,
                      color: Colors.grey,
                    ),
                  ),
                  validator: ((value) {
                    if (value!.isEmpty) {
                      return 'Required';
                    } else {
                      return null;
                    }
                  }),
                  onSaved: (value) {
                    setState(() {
                      nameController.text = value!;
                    });
                  },
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  controller: enrollmentController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderSide: BorderSide()),
                    hintText: 'Enter your Enrollment Number',
                    hintStyle: TextStyle(color: Colors.grey),
                    labelText: 'Enrollment number',
                    labelStyle: TextStyle(color: Colors.grey),
                    prefixIcon: Icon(
                      Icons.numbers,
                      color: Colors.grey,
                    ),
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: ((value) {
                    if (value!.length > 12) {
                      return 'Enter valid enrollment number';
                    } else {
                      return null;
                    }
                  }),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                SizedBox(
                  height: 10.0,
                ),
                DropdownButtonFormField(
                  value: _selectedItem,
                  items: branchList
                      .map((e) => DropdownMenuItem(
                            value: e,
                            child: Text(e),
                          ))
                      .toList(),
                  onChanged: (item) {
                    setState(() {
                      _selectedItem = item!;
                    });
                  },
                  validator: ((value) {
                    if (value!.isEmpty) {
                      return 'Required';
                    } else {
                      return null;
                    }
                  }),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderSide: BorderSide()),
                    hintText: 'Select your Branch',
                    hintStyle: TextStyle(color: Colors.grey),
                    labelText: 'Branch',
                    labelStyle: TextStyle(color: Colors.grey),
                    prefixIcon: Icon(
                      Icons.class_,
                      color: Colors.grey,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Center(
                  child: SizedBox(
                    height: 56.0,
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      style: TextButton.styleFrom(
                        backgroundColor: kPrimaryColor,
                      ),
                      onPressed: () {
                        FocusScope.of(context).unfocus();
                        if (studentformkey.currentState!.validate()) {
                          studentformkey.currentState!.save();
                          user.createUser(
                            name: nameController.text.trim(),
                            branch: _selectedItem,
                            enrollmentNumber:
                                enrollmentController.text.trim().toUpperCase(),
                          );
                          showSnackBar(context, 'Student has been Added');
                          clearEntries();
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const ListOfStudents()));
                        } else {
                          showSnackBar(context, 'Incomplete fields');
                        }
                      },
                      child: Text(
                        'Continue',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
