import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collegeproject/Widgets/CustomDrawer.dart';
import 'package:collegeproject/Widgets/titletext.dart';
import 'package:flutter/material.dart';

class StudentList extends StatefulWidget {
  const StudentList({super.key});

  @override
  State<StudentList> createState() => _StudentListState();
}

class _StudentListState extends State<StudentList> {
  final studentEntry = FirebaseFirestore.instance.collection('studentEntry');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Center(
          child: Text(
            'Student List',
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
        child: FutureBuilder(
          future: studentEntry.get(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return const TitleText(
                text: 'Something went wrong!',
              );
            }
            if (snapshot.connectionState == ConnectionState.done) {
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: DataTable(
                    columnSpacing: 12.0,
                    horizontalMargin: 12.0,
                    columns: const [
                      DataColumn(
                        label: Expanded(
                            child: Text(
                          'Student Name',
                          softWrap: true,
                        )),
                      ),
                      DataColumn(
                        label: Expanded(child: Text('Mobile Number')),
                      ),
                      DataColumn(
                        label: Expanded(child: Text('School Name')),
                      ),
                      DataColumn(
                        label: Expanded(child: Text('State')),
                      ),
                      DataColumn(
                        label: Expanded(child: Text('City')),
                      ),
                      DataColumn(
                        label: Expanded(child: Text('Stream')),
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
                                    Text(
                                      element["mobile"],
                                      softWrap: true,
                                    ),
                                  ),
                                  DataCell(
                                    Text(
                                      element["school"],
                                      softWrap: true,
                                    ),
                                  ),
                                  DataCell(
                                    Text(
                                      element["state"],
                                      softWrap: true,
                                    ),
                                  ),
                                  DataCell(
                                    Text(
                                      element["city"],
                                      softWrap: true,
                                    ),
                                  ),
                                  DataCell(
                                    Text(
                                      element["stream"],
                                      softWrap: true,
                                    ),
                                  ),
                                  // DataCell(
                                  //   const Icon(Icons.delete),
                                  //   onTap: () {
                                  //     setState(() {
                                  //       studentEntry.doc(element.id).delete();
                                  //     });
                                  //   },
                                  // ),
                                ],
                              )),
                        )
                        .toList(),
                  ),
                ),
              );
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
