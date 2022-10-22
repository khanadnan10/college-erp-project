// ignore_for_file: use_key_in_widget_constructors, must_be_immutable, sort_child_properties_last, use_build_context_synchronously

import 'dart:async';

import 'package:collegeproject/utils/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import '../../utils/showSnackbar.dart';
import '../home.dart';
import '../../utils/constants.dart';

class EmailVerification extends StatefulWidget {
  @override
  State<EmailVerification> createState() => _EmailVerificationState();
}

class _EmailVerificationState extends State<EmailVerification> {
  final userEmail = FirebaseAuth.instance.currentUser!.email;

  bool isEmailVerified = false;
  bool canResendEmail = false;

  Timer? timer;

  @override
  void initState() {
    super.initState();
    isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    if (!isEmailVerified) {
      sendEmailVerification(context);

      timer = Timer.periodic(const Duration(seconds: 3), (timer) {
        checkEmailVerified();
      });
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  Future checkEmailVerified() async {
    await FirebaseAuth.instance.currentUser!.reload();

    setState(() {
      isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    });

    if (isEmailVerified) timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return isEmailVerified
        ? Home()
        : Scaffold(
            body: SafeArea(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.network(
                        'https://assets6.lottiefiles.com/packages/lf20_OjG2Td.json'),
                    const SizedBox(
                      height: 25.0,
                    ),
                    Text(
                      'Verify your email',
                      style: GoogleFonts.poppins(
                        fontSize: 25.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      'Use the link sent to your email at $userEmail to verify your email.',
                      style: GoogleFonts.poppins(
                        fontSize: 16.0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 50.0,
                      child: ElevatedButton(
                        onPressed: (() => canResendEmail
                            ? sendEmailVerification(context)
                            : null),
                        child: const Text(
                          'Resend Email',
                        ),
                        style: TextButton.styleFrom(
                          backgroundColor: kHeadingColor,
                          elevation: 0,
                        ),
                        // backgroundColor: MaterialStateProperty.all(kPrimaryColor),
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 50.0,
                      child: ElevatedButton(
                        onPressed: () => FirebaseAuth.instance.signOut(),
                        child: Text(
                          'Cancel',
                          style: GoogleFonts.poppins(color: kHeadingColor),
                        ),
                        style: TextButton.styleFrom(
                          side: const BorderSide(color: kHeadingColor),
                          elevation: 0,
                          backgroundColor: Colors.white,
                        ),
                        // backgroundColor: MaterialStateProperty.all(kPrimaryColor),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ));
  }

  Future sendEmailVerification(BuildContext context) async {
    try {
      await FirebaseAuth.instance.currentUser!.sendEmailVerification();
      showSnackBar(context, 'Email verification sent!');

      setState(() async {
        canResendEmail = false;
      });

      await Future.delayed(const Duration(seconds: 5));

      setState(() async {
        canResendEmail = true;
      });
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
    }
  }
}
