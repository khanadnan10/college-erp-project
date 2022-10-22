import 'package:flutter/material.dart';

class Attendence extends StatelessWidget {
  const Attendence({super.key});

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
