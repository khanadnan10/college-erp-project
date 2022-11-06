import 'package:collegeproject/Widgets/CustomDrawer.dart';
import 'package:collegeproject/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AttendenceScreen extends StatelessWidget {
  AttendenceScreen({super.key});

  DateTime _initialDate = DateTime.now();

  Future<DateTime?> datePicker(BuildContext context) async {
    DateTime? date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1999),
      lastDate: DateTime(2050),
    );
    return date;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Center(
          child: Text(
            'Attendence',
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: 'Date of attendence ',
                  hintStyle: TextStyle(color: Colors.grey),
                  labelText: 'Date',
                  labelStyle: TextStyle(color: Colors.grey),
                  prefixIcon: Icon(
                    Icons.calendar_month,
                    color: Colors.grey,
                  ),
                ),
                onTap: () => datePicker(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
