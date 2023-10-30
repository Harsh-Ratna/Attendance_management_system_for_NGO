import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GetClass extends StatefulWidget {
  final String documentId;

  GetClass({
    Key? key,
    required this.documentId,
  }) : super(key: key);

  @override
  State<GetClass> createState() => _GetClassState();
}

class _GetClassState extends State<GetClass> {
  @override
  List<String> items = [];

  Widget build(BuildContext context) {
    // Get a reference to the "Students" collection.
    CollectionReference students =
        FirebaseFirestore.instance.collection('Students');

    return FutureBuilder<DocumentSnapshot>(
      future: students.doc(widget.documentId).get(),
      builder: (context, studentSnapshot) {
        if (studentSnapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> studentData =
              studentSnapshot.data!.data() as Map<String, dynamic>;

          // Get the document reference from the "class" field.
          DocumentReference classReference =
              studentData['class'] as DocumentReference;

          // Specify the "Classes" collection and use another FutureBuilder to fetch the class document.
          return FutureBuilder<DocumentSnapshot>(
            future: FirebaseFirestore.instance
                .collection('Classes')
                .doc(classReference.id)
                .get(),
            builder: (context, classSnapshot) {
              if (classSnapshot.connectionState == ConnectionState.done) {
                Map<String, dynamic> classData =
                    classSnapshot.data!.data() as Map<String, dynamic>;
                String className = classData['name'] as String;
                items.add(className);

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
