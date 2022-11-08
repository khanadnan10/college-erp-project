import 'package:collegeproject/Widgets/CustomDrawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../services/fireStore/StudentDatabase.dart';
import '../../utils/constants.dart';
import '../../utils/showSnackbar.dart';

class StudentEntryScreen extends StatefulWidget {
  const StudentEntryScreen({super.key});

  @override
  State<StudentEntryScreen> createState() => _StudentEntryScreenState();
}

class _StudentEntryScreenState extends State<StudentEntryScreen> {
  static final GlobalKey<FormState> studentformkey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController schoolNameController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();

  final StudentDatabase user = StudentDatabase();

  final List<String> streamList = ['Science', 'Commerce', 'Arts'];

  String _selectedstream = 'Science';

  void clearEntries() {
    nameController.clear();
    mobileNumberController.clear();
    schoolNameController.clear();
    stateController.clear();
    cityController.clear();
  }

  @override
  void dispose() {
    nameController.dispose();
    mobileNumberController.dispose();
    schoolNameController.dispose();
    stateController.dispose();
    cityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Center(
          child: Text(
            'Student Entry',
            style: TextStyle(
              color: Colors.black54,
              fontWeight: FontWeight.w500,
              fontSize: 16.0,
            ),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0.9,
        leading: Builder(
          builder: (context) {
            return IconButton(
              onPressed: () => Scaffold.of(context).openDrawer(),
              icon: const Icon(
                Icons.menu,
                color: Colors.black,
              ),
            );
          },
        ),
      ),
      drawer: const CustomDrawer(),
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
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(borderSide: BorderSide()),
                    hintText: 'Enter your name',
                    hintStyle: TextStyle(color: Colors.grey),
                    labelText: 'Student Name',
                    labelStyle: TextStyle(color: Colors.grey),
                    prefixIcon: Icon(
                      Icons.people,
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
                const SizedBox(
                  height: 10.0,
                ),

                TextFormField(
                  controller: mobileNumberController,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(borderSide: BorderSide()),
                    hintText: 'Enter your Mobile Number',
                    hintStyle: TextStyle(color: Colors.grey),
                    labelText: 'Mobile Number',
                    labelStyle: TextStyle(color: Colors.grey),
                    prefixIcon: Icon(
                      Icons.phone,
                      color: Colors.grey,
                    ),
                  ),
                  validator: ((value) {
                    if (value!.isEmpty || value.length < 10) {
                      return 'Required';
                    } else {
                      return null;
                    }
                  }),
                  onSaved: (value) {
                    setState(() {
                      mobileNumberController.text = value!;
                    });
                  },
                ),
                const SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  controller: schoolNameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(borderSide: BorderSide()),
                    hintText: 'Enter your School Name',
                    hintStyle: TextStyle(color: Colors.grey),
                    labelText: 'School Name',
                    labelStyle: TextStyle(color: Colors.grey),
                    prefixIcon: Icon(
                      Icons.school,
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
                      schoolNameController.text = value!;
                    });
                  },
                ),
                const SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  controller: stateController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(borderSide: BorderSide()),
                    hintText: 'Enter your State',
                    hintStyle: TextStyle(color: Colors.grey),
                    labelText: 'State',
                    labelStyle: TextStyle(color: Colors.grey),
                    prefixIcon: Icon(
                      Icons.location_city,
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
                      stateController.text = value!;
                    });
                  },
                ),
                const SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  controller: cityController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(borderSide: BorderSide()),
                    hintText: 'Enter your city',
                    hintStyle: TextStyle(color: Colors.grey),
                    labelText: 'City',
                    labelStyle: TextStyle(color: Colors.grey),
                    prefixIcon: Icon(
                      Icons.apartment,
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
                      cityController.text = value!;
                    });
                  },
                ),
                const SizedBox(
                  height: 10.0,
                ),
                // -----------------------------
                DropdownButtonFormField(
                  value: _selectedstream,
                  items: streamList
                      .map((e) => DropdownMenuItem(
                            value: e,
                            child: Text(e),
                          ))
                      .toList(),
                  onChanged: (item) {
                    setState(() {
                      _selectedstream = item!;
                    });
                  },
                  validator: ((value) {
                    if (value!.isEmpty) {
                      return 'Required';
                    } else {
                      return null;
                    }
                  }),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(borderSide: BorderSide()),
                    hintText: 'Select your stream',
                    hintStyle: TextStyle(color: Colors.grey),
                    labelText: 'Stream',
                    labelStyle: TextStyle(color: Colors.grey),
                    prefixIcon: Icon(
                      Icons.stream,
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
                          user.studentEntry(
                            name: nameController.text.trim(),
                            mobile: mobileNumberController.text.trim(),
                            school: schoolNameController.text.trim(),
                            state: stateController.text.trim(),
                            city: cityController.text.trim(),
                            stream: _selectedstream,
                          );
                          showSnackBar(context, 'Student has been Added 🎉');
                          clearEntries();
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) =>
                          //             const ListOfStudentsScreen()));
                        } else {
                          showSnackBar(context, 'Incomplete fields');
                        }
                      },
                      child: const Text(
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
