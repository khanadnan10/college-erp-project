// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:collegeproject/screens/Attendence/attendence.dart';
import 'package:collegeproject/screens/ListOfStudent/listofstudent.dart';
import 'package:collegeproject/screens/Result/result.dart';
import 'package:collegeproject/screens/SchoolEntry/schoolEntry.dart';
import 'package:collegeproject/screens/SchoolEntry/schoolList.dart';
import 'package:collegeproject/screens/StudentEntry/studentEntry.dart';
import 'package:collegeproject/screens/StudentEntry/studentList.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      child: Image.asset(
                        'assets/images/nriLogo.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    const Text(
                      'Smart Data',
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          ListTile(
            leading: Image.asset(
              'assets/images/studenticon.png',
              height: 30.0,
            ),
            title: const Text(
              'Student Entry',
            ),
            onTap: (() {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const StudentEntryScreen()));
            }),
          ),
          ListTile(
            leading: Image.asset(
              'assets/images/users.png',
              fit: BoxFit.cover,
              height: 30.0,
            ),
            title: const Text(
              'Student List',
            ),
            onTap: (() {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const StudentList()));
            }),
          ),
          ListTile(
            leading: Image.asset(
              'assets/images/profile.png',
              height: 30.0,
            ),
            title: const Text(
              'School Entry',
            ),
            onTap: (() {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SchoolEntryScreen()));
            }),
          ),
          ListTile(
            leading: Image.asset(
              'assets/images/schoolList.png',
              fit: BoxFit.cover,
              height: 30.0,
            ),
            title: const Text(
              'School List',
            ),
            onTap: (() {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SchoolList()));
            }),
          ),
        ],
      ),
    );
  }
}
