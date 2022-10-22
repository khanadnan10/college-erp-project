// ignore_for_file: prefer_const_constructors, sort_child_properties_last, curly_braces_in_flow_control_structures, use_build_context_synchronously
import 'package:collegeproject/main.dart';
import 'package:collegeproject/utils/constants.dart';
import 'package:collegeproject/utils/showSnackbar.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmpasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmpasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const SizedBox(
                  height: 50.0,
                ),
                Text(
                  'Create your account',
                  style: GoogleFonts.poppins(
                    fontSize: 28.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Text("Let's get all set up! ♥",
                    style: GoogleFonts.poppins(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                    )),
                const SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    hintText: 'Enter your email',
                    hintStyle: TextStyle(color: Colors.grey),
                    labelText: 'Email',
                    labelStyle: TextStyle(color: Colors.grey),
                    icon: Icon(
                      Icons.alternate_email,
                      color: Colors.grey,
                    ),
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: ((email) {
                    email != null && EmailValidator.validate(email)
                        ? 'Enter a valid email'
                        : null;
                  }),
                ),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Enter your password',
                    hintStyle: TextStyle(color: Colors.grey),
                    labelText: 'Password',
                    labelStyle: TextStyle(color: Colors.grey),
                    icon: Icon(
                      Icons.lock_outline_sharp,
                      color: Colors.grey,
                    ),
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: ((password) {
                    password != null && password.length < 6
                        ? 'Enter min. 6 characters'
                        : null;
                  }),
                ),
                TextFormField(
                  controller: _confirmpasswordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Enter your email',
                    hintStyle: TextStyle(color: Colors.grey),
                    labelText: 'Confirm Password',
                    labelStyle: TextStyle(color: Colors.grey),
                    icon: Icon(
                      Icons.lock_outline_sharp,
                    ),
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: ((password) {
                    password != null && password.length < 6
                        ? 'Enter min. 6 characters'
                        : null;
                  }),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 50.0,
                  child: ElevatedButton(
                    onPressed: signUpAuth,
                    child: Text(
                      'Continue',
                    ),
                    style: TextButton.styleFrom(
                      backgroundColor: kHeadingColor,
                    ),
                    // backgroundColor: MaterialStateProperty.all(kPrimaryColor),
                  ),
                ),
                const SizedBox(
                  height: 40.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account? ',
                      style: TextStyle(
                        color: Colors.black54,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(
                          color: kHeadingColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future signUpAuth() async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Center(
        child: CircularProgressIndicator(),
      ),
    );

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      // await sendEmailVerification(context);
    } on FirebaseAuthException catch (e) {
      print(e);
      showSnackBar(context, "Something went wrong. Try again!");
    }
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}
