import 'package:collegeproject/Widgets/CustomDrawer.dart';
import 'package:flutter/material.dart';

import '../../../services/fireStore/StudentDatabase.dart';
import '../../../utils/constants.dart';
import '../../../utils/showSnackbar.dart';

class SchoolEntryScreen extends StatefulWidget {
  const SchoolEntryScreen({super.key});

  @override
  State<SchoolEntryScreen> createState() => _SchoolEntryScreenState();
}

class _SchoolEntryScreenState extends State<SchoolEntryScreen> {
  static final GlobalKey<FormState> studentformkey = GlobalKey<FormState>();

  TextEditingController schoolNameController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController zoneController = TextEditingController();
  TextEditingController teamController = TextEditingController();
  TextEditingController schoolTypeController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController areaController = TextEditingController();
  TextEditingController staffNameController = TextEditingController();

  final StudentDatabase user = StudentDatabase();

  void clearEntries() {
    schoolNameController.clear();
    stateController.clear();
    zoneController.clear();
    teamController.clear();
    schoolTypeController.clear();
    cityController.clear();
    areaController.clear();
    staffNameController.clear();
  }

  @override
  void dispose() {
    schoolNameController.dispose();
    stateController.dispose();
    zoneController.dispose();
    teamController.dispose();
    schoolTypeController.dispose();
    cityController.dispose();
    areaController.dispose();
    staffNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Center(
          child: Text(
            'School Entry',
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
              children: [
                TextFormField(
                  controller: schoolNameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(borderSide: BorderSide()),
                    hintText: 'Enter school name',
                    hintStyle: TextStyle(color: Colors.grey),
                    labelText: 'school Name',
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
                    hintText: 'Enter State',
                    hintStyle: TextStyle(color: Colors.grey),
                    labelText: 'State Name',
                    labelStyle: TextStyle(color: Colors.grey),
                    prefixIcon: Icon(
                      Icons.location_city,
                      color: Colors.grey,
                    ),
                  ),
                  validator: ((value) {
                    if (value!.isEmpty || value.length > 10) {
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
                  controller: zoneController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(borderSide: BorderSide()),
                    hintText: 'Enter your zone',
                    hintStyle: TextStyle(color: Colors.grey),
                    labelText: 'Zone',
                    labelStyle: TextStyle(color: Colors.grey),
                    prefixIcon: Icon(
                      Icons.build,
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
                      zoneController.text = value!;
                    });
                  },
                ),
                const SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  controller: teamController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(borderSide: BorderSide()),
                    hintText: 'Enter team',
                    hintStyle: TextStyle(color: Colors.grey),
                    labelText: 'Team',
                    labelStyle: TextStyle(color: Colors.grey),
                    prefixIcon: Icon(
                      Icons.group,
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
                      teamController.text = value!;
                    });
                  },
                ),
                const SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  controller: schoolTypeController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(borderSide: BorderSide()),
                    hintText: 'Enter School type',
                    hintStyle: TextStyle(color: Colors.grey),
                    labelText: 'School type',
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
                      schoolTypeController.text = value!;
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
                TextFormField(
                  controller: areaController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(borderSide: BorderSide()),
                    hintText: 'Enter area',
                    hintStyle: TextStyle(color: Colors.grey),
                    labelText: 'Area',
                    labelStyle: TextStyle(color: Colors.grey),
                    prefixIcon: Icon(
                      Icons.area_chart,
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
                      areaController.text = value!;
                    });
                  },
                ),
                const SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  controller: staffNameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(borderSide: BorderSide()),
                    hintText: 'Enter staff name',
                    hintStyle: TextStyle(color: Colors.grey),
                    labelText: 'Staff name',
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
                      staffNameController.text = value!;
                    });
                  },
                ),
                const SizedBox(
                  height: 10.0,
                ),
                // -----------------------------

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
                          user.schoolEntry(
                              school: schoolNameController.text.trim(),
                              state: stateController.text.trim(),
                              zone: zoneController.text.trim(),
                              team: teamController.text.trim(),
                              schoolType: schoolTypeController.text.trim(),
                              city: cityController.text.trim(),
                              area: areaController.text.trim(),
                              staffName: staffNameController.text.trim());

                          showSnackBar(context, '🏫 School has been Added');
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
                        'Save',
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
