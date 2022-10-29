// ignore_for_file: prefer_const_constructors, sort_child_properties_last
import 'package:collegeproject/screens/Attendence/attendence.dart';
import 'package:collegeproject/screens/ListOfStudent/addStudents.dart';
import 'package:collegeproject/screens/ListOfStudent/listofstudent.dart';
import 'package:collegeproject/screens/Result/result.dart';
import 'package:collegeproject/utils/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../Widgets/CustomDrawer.dart';
import '../Widgets/CustomCard.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final user = FirebaseAuth.instance.currentUser!;
  var scaffoldKey = GlobalKey<ScaffoldState>();
  bool isLoggedIn = true;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.width;

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Center(
          child: Text(
            'Home',
            style: TextStyle(
              color: Colors.black54,
              fontWeight: FontWeight.w500,
              fontSize: 16.0,
            ),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0.9,
        leading: IconButton(
          onPressed: () => scaffoldKey.currentState?.openDrawer(),
          icon: Icon(
            Icons.menu,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              setState(() {
                isLoggedIn = false;
              });

              await Future.delayed(
                Duration(seconds: 1),
              );
              FirebaseAuth.instance.signOut();
            },
            icon: isLoggedIn
                ? Icon(
                    Icons.logout,
                    color: Colors.black,
                  )
                : SizedBox(
                    child: CircularProgressIndicator(
                      color: Colors.black54,
                    ),
                    height: 25.0,
                    width: 25.0,
                  ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.add),
        backgroundColor: kPrimaryColor,
        label: Text('Add Student'),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddStudents()));
        },
      ),
      drawer: CustomDrawer(),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      height: height / 3,
                      width: width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: kProfileCardColor,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Welcome,',
                                  style: TextStyle(
                                    // color: Colors.grey.shade700,
                                    color: kWhiteColor,
                                    fontSize: 14.0,
                                  ),
                                ),
                                Text(
                                  '${user.email}',
                                  style: TextStyle(
                                    // color: Colors.grey.shade700,
                                    color: kWhiteColor,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18.0,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              DateFormat.yMMMMd('en_US').format(DateTime.now()),
                              style: TextStyle(
                                // color: Colors.grey.shade700,
                                color: kWhiteColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  Row(
                    children: [
                      CustomeCard(
                        height: height / 2,
                        width: width,
                        text: 'Attendence',
                        image: Image.asset(
                          'assets/images/attendence.png',
                          fit: BoxFit.cover,
                          height: 130.0,
                        ),
                        color: kRandomColor1,
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const AttendenceScreen()));
                        },
                      ),
                      CustomeCard(
                        height: height / 2,
                        width: width,
                        image: Image.asset(
                          'assets/images/contract.png',
                          height: 130.0,
                        ),
                        text: 'List Of Students',
                        color: kRandomColor2,
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const ListOfStudentsScreen()));
                        },
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ResultScreen()));
                    },
                    child: Container(
                      margin: const EdgeInsets.all(12.0),
                      height: height / 2,
                      width: width,
                      decoration: BoxDecoration(
                        color: kRandomColor3,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Image.asset(
                              'assets/images/growth-graph.png',
                              // height: 190.0,
                            ),
                            Text(
                              'Result',
                              style: const TextStyle(
                                  fontSize: 24.0, overflow: TextOverflow.clip),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
