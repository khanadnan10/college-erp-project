import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../Widgets/titletext.dart';

class SchoolList extends StatefulWidget {
  const SchoolList({super.key});

  @override
  State<SchoolList> createState() => _SchoolListState();
}

class _SchoolListState extends State<SchoolList> {
  final schoolEntry = FirebaseFirestore.instance.collection('schoolEntry');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Center(
          child: Text(
            'School List',
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
      body: FutureBuilder(
        future: schoolEntry.get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.data == null) {
            return const Text('Nothing much there!');
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
                      label: Expanded(child: Text('School')),
                    ),
                    DataColumn(
                      label: Expanded(child: Text('State')),
                    ),
                    DataColumn(
                      label: Expanded(child: Text('Zone')),
                    ),
                    DataColumn(
                      label: Expanded(child: Text('Team')),
                    ),
                    DataColumn(
                      label: Expanded(child: Text('School Type')),
                    ),
                    DataColumn(
                      label: Expanded(child: Text('City')),
                    ),
                    DataColumn(
                      label: Expanded(child: Text('Area')),
                    ),
                    DataColumn(
                      label: Expanded(child: Text('Staff Name')),
                    ),
                  ],
                  rows: snapshot.data!
                      .docs // Loops through dataColumnText, each iteration assigning the value to element
                      .map(
                        ((element) => DataRow(
                              cells: <DataCell>[
                                DataCell(Text(
                                  element["school"],
                                  softWrap: true,
                                )), //Extracting from Map element the value
                                DataCell(
                                  Text(
                                    element["state"],
                                    softWrap: true,
                                  ),
                                ),
                                DataCell(
                                  Text(
                                    element["zone"],
                                    softWrap: true,
                                  ),
                                ),
                                DataCell(
                                  Text(
                                    element["team"],
                                    softWrap: true,
                                  ),
                                ),
                                DataCell(
                                  Text(
                                    element["schoolType"],
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
                                    element["area"],
                                    softWrap: true,
                                  ),
                                ),
                                DataCell(
                                  Text(
                                    element["staffName"],
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
    );
  }
}
