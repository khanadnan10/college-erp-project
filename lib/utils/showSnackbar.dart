import 'package:collegeproject/utils/constants.dart';
import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text),
      backgroundColor: kHeadingColor,
      behavior: SnackBarBehavior.floating,
    ),
  );
}
