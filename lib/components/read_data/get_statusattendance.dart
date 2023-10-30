import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetStatus extends StatelessWidget {
  final String documentId;

  const GetStatus({
    super.key,
    required this.documentId,
  });

  @override
  Widget build(BuildContext context) {
    //get the collection
    CollectionReference students =
        FirebaseFirestore.instance.collection('Maths Attendance');

    return FutureBuilder<DocumentSnapshot>(
      future: students.doc(documentId).get(),
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return Text(
            '${data['status']}',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          );
        }
        return Text("Loading..");
      }),
    );
  }
}
