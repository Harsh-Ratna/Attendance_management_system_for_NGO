import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/components/models/student.dart';
import 'package:firebase/components/read_data/get_class.dart';
import 'package:firebase/components/read_data/get_name.dart';
import 'package:firebase/components/read_data/get_nameattendance.dart';
import 'package:firebase/components/read_data/get_statusattendance.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ViewAttendance extends StatefulWidget {
  const ViewAttendance({super.key});

  @override
  State<ViewAttendance> createState() => _ViewAttendanceState();
}

class _ViewAttendanceState extends State<ViewAttendance> {
  List<String> docIDs = [];
  List<String> classdocIDs = [];

  final user = FirebaseAuth.instance.currentUser!;
  //get docIDs
  Future getDocId() async {
    await FirebaseFirestore.instance.collection('Maths Attendance').get().then(
          (snapshot) => snapshot.docs.forEach((document) {
            docIDs.add(document.reference.id);
          }),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 40.0),
          child: Text(user.email!),
        ),
      ),
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      body: Column(children: [
        Expanded(
          child: FutureBuilder(
            future: getDocId(),
            builder: (context, snapshot) {
              return Padding(
                padding: const EdgeInsets.only(top: 20),
                child: ListView.builder(
                  itemCount: docIDs.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: ListTile(
                        selectedTileColor: Color(0xffD3E6F5),
                        tileColor: Color(0xffF4F3F3),
                        title: GetNameattendance(documentId: docIDs[index]),
                        subtitle: GetStatus(documentId: docIDs[index]),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ),
      ]),
    );
  }
}
