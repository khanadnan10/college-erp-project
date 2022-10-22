// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../screens/Attendence/attendence.dart';

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
                // Text('Last Login: '+
                //   DateFormat.jm('en_US').format(DateTime.now()),
                //   style: const TextStyle(
                //     color: Colors.grey,
                //   ),
                // ),
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
                  MaterialPageRoute(builder: (context) => const Attendence()));
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
            onTap: (() {}),
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
            onTap: (() {}),
          ),
        ],
      ),
    );
  }
}
