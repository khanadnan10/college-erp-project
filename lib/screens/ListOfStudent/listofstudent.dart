import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collegeproject/Widgets/CustomDrawer.dart';
import 'package:collegeproject/services/fireStore/StudentFirestore.dart';
import 'package:flutter/material.dart';

import '../../utils/constants.dart';
import 'addStudents.dart';

class ListOfStudentsScreen extends StatefulWidget {
  const ListOfStudentsScreen({super.key});

  @override
  State<ListOfStudentsScreen> createState() => _ListOfStudentsScreenState();
}

class _ListOfStudentsScreenState extends State<ListOfStudentsScreen> {
  StudentFirestore user = StudentFirestore();

  CollectionReference studentdata =
      FirebaseFirestore.instance.collection('Students');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'List of students',
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
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.add),
        backgroundColor: kPrimaryColor,
        label: const Text('Add Student'),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddStudents()));
        },
      ),
      body: FutureBuilder(
        future: studentdata.get(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Column(
                children: const [
                  Icon(Icons.error),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text('Something went wrong!'),
                ],
              ),
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          // final List studentDocs = [];

          // snapshot.data!.docs.map((e) {
          //   Map a = e.data() as Map<String, dynamic>;
          //   studentDocs.add(a);
          // }).toList();

          if (snapshot.connectionState == ConnectionState.done) {
            return SingleChildScrollView(
              // physics: const BouncingScrollPhysics(),
              // scrollDirection: Axis.horizontal,
              child: DataTable(
                columnSpacing: 12.0,
                horizontalMargin: 12.0,
                columns: const [
                  DataColumn(
                    label: Expanded(child: Text('Name')),
                  ),
                  DataColumn(
                    label: Expanded(
                        child: Text(
                      'Enrollment Number',
                      softWrap: true,
                    )),
                  ),
                  DataColumn(
                    label: Expanded(child: Text('Branch')),
                  ),
                  DataColumn(
                    label: Expanded(child: Text('Delete')),
                  ),
                ],
                rows: snapshot.data!
                    .docs // Loops through dataColumnText, each iteration assigning the value to element
                    .map(
                      ((element) => DataRow(
                            cells: <DataCell>[
                              DataCell(Text(
                                element["name"],
                                softWrap: true,
                              )), //Extracting from Map element the value
                              DataCell(
                                Text(element["enrollmentNumber"]),
                              ),
                              DataCell(
                                Text(element["branch"]),
                              ),
                              DataCell(
                                const Icon(Icons.delete),
                                onTap: () {
                                  setState(() {
                                    studentdata.doc(element.id).delete();
                                  });
                                },
                              ),
                            ],
                          )),
                    )
                    .toList(),
              ),
            );
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}

/* 
SingleChildScrollView(
        child: Column(
          children: [
            DataTable(
              columns: const [
                DataColumn(
                  label: Expanded(child: Text('Name')),
                ),
                DataColumn(
                  label: Expanded(child: Text('Enrollment Number')),
                ),
                DataColumn(
                  label: Expanded(child: Text('Branch')),
                ),
              ],
              rows: const [
                DataRow(
                  cells: [
                    DataCell(
                      Text('Adnan'),
                    ),
                    DataCell(
                      Text('0115CS201006'),
                    ),
                    DataCell(
                      Text('CSE'),
                    ),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(
                      Text('Kasif'),
                    ),
                    DataCell(
                      Text('0115CS201052'),
                    ),
                    DataCell(
                      Text('CSE'),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
*/
