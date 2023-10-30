import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/components/my_button.dart';
import 'package:firebase/components/my_dropdown.dart';
import 'package:firebase/components/my_textfield.dart';
import 'package:firebase/components/small_button.dart';
import 'package:flutter/material.dart';

import '../../../components/models/student.dart';

class AddStudents extends StatefulWidget {
  AddStudents({super.key});

  @override
  State<AddStudents> createState() => _AddStudentsState();
}

class _AddStudentsState extends State<AddStudents> {
  final namecontroller = TextEditingController();

  final classcontroller = TextEditingController();

  final idcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 200,
                    decoration: BoxDecoration(
                      color: Color(0xff1F88DD),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: 100,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 14, vertical: 14),
                            child: Image.asset(
                                'assets/images/akshar paaul logo.png'),
                          ),
                        ),
                        Center(
                          child: Container(
                            width: 250,
                            height: 45,
                            child: Center(
                              child: Text(
                                "Add Students",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                              ),
                            ),
                            decoration: BoxDecoration(
                                color: Color(0xff136FB5),
                                borderRadius: BorderRadius.circular(20)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20,
                ),
                MyTextField(
                    controller: namecontroller,
                    hintText: 'Student Name',
                    obscureText: false),
                SizedBox(
                  height: 20,
                ),
                MyDropdownPage(),
                //MyTextField(
                //   controller: classcontroller,
                //   hintText: 'Class Name',
                //   obscureText: false),
                SizedBox(
                  height: 20,
                ),
                MyTextField(
                    controller: idcontroller,
                    hintText: 'Roll Number or ID',
                    obscureText: false),
                SizedBox(height: 30),
                MyButton(
                    data: 'Submit',
                    onTap: () {
                      final name = namecontroller.text;
                      final classes = classcontroller.text;
                      final id = int.parse(idcontroller.text);
                      createStudent(name: name, classes: classes, id: id);
                      addstudentMessage();
                    },
                    color: Color(0xff136FB5)),
              ],
            )
          ]),
        ),
      ),
    );
  }

  void addstudentMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Center(child: Text("Student Added ✅")),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Continue'))
          ],
        );
      },
    );
  }

  AppBar appBar() {
    return AppBar(
      title: const Text(
        'Akshar Paaul',
        style: TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
      ),
      backgroundColor: Color(0xff1F88DD),
      elevation: 0, //to remove the shadow of appbar
      centerTitle: true,
      leading: GestureDetector(
        onTap: () {},
        child: Container(
          margin: EdgeInsets.all(10),
          alignment: Alignment.center,
          child: Icon(Icons.menu),
        ),
      ),
    );
  }

  Future createStudent(
      {required String name, required String classes, required int id}) async {
    //reference to document
    final docUser =
        FirebaseFirestore.instance.collection('Students').doc(id.toString());

    final student = Student(
      name: name,
      id: id,
      grade: classes,
    );
    //Create Document and write data to Firebase
    final json = student.toJson();
    await docUser.set(json);
  }
}
