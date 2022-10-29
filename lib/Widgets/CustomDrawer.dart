// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:collegeproject/screens/Attendence/attendence.dart';
import 'package:collegeproject/screens/ListOfStudent/listofstudent.dart';
import 'package:collegeproject/screens/Result/result.dart';
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  DateFormat.yMMMMd('en_US').format(DateTime.now()),
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Image.asset(
              'assets/images/attendence.png',
              fit: BoxFit.cover,
              height: 50.0,
            ),
            title: const Text(
              'Attendence',
            ),
            onTap: (() {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const AttendenceScreen()));
            }),
          ),
          ListTile(
            leading: Image.asset(
              'assets/images/contract.png',
              fit: BoxFit.cover,
              height: 50.0,
            ),
            title: const Text(
              'List Of Students',
            ),
            onTap: (() {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ListOfStudentsScreen()));
            }),
          ),
          ListTile(
            leading: Image.asset(
              'assets/images/growth-graph.png',
              fit: BoxFit.cover,
              height: 50.0,
            ),
            title: const Text(
              'Result',
            ),
            onTap: (() {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ResultScreen()));
            }),
          ),
        ],
      ),
    );
  }
}
