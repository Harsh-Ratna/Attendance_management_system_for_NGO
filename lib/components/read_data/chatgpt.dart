import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GetClass extends StatelessWidget {
  final String documentId;

  const GetClass({
    super.key,
    required this.documentId,
  });

  @override
  Widget build(BuildContext context) {
    // Get a reference to the "Students" collection.
    CollectionReference students =
        FirebaseFirestore.instance.collection('Students');

    return FutureBuilder<DocumentSnapshot>(
      future: students.doc(documentId).get(),
      builder: (context, studentSnapshot) {
        if (studentSnapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> studentData =
              studentSnapshot.data!.data() as Map<String, dynamic>;

          // Get the document reference from the "class" field.
          DocumentReference classReference =
              studentData['class'] as DocumentReference;

          // Use another FutureBuilder to fetch the class document.
          return FutureBuilder<DocumentSnapshot>(
            future: classReference.get(),
            builder: (context, classSnapshot) {
              if (classSnapshot.connectionState == ConnectionState.done) {
                Map<String, dynamic> classData =
                    classSnapshot.data!.data() as Map<String, dynamic>;
                String className = classData['name'] as String;

                return Text(
                  'Class: $className',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                );
              }

              return Text("Loading class name..");
            },
          );
        }

        return Text("Loading..");
      },
    );
  }
}
