import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetName extends StatelessWidget {
  final String documentId;

  const GetName({
    super.key,
    required this.documentId,
  });

  @override
  Widget build(BuildContext context) {
    //get the collection
    CollectionReference students =
        FirebaseFirestore.instance.collection('Students');

    return FutureBuilder<DocumentSnapshot>(
      future: students.doc(documentId).get(),
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return Text(
            '${data['name']}',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          );
        }
        return Text("Loading..");
      }),
    );
  }
}
