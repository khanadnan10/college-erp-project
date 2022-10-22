import 'package:flutter/material.dart';

class ListOfStudents extends StatelessWidget {
  const ListOfStudents({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}
