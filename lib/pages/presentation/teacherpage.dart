import 'package:firebase/components/my_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

import '../../components/small_button.dart';

class TeacherPage extends StatelessWidget {
  TeacherPage({super.key});

  final user = FirebaseAuth.instance.currentUser!;

  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 180,
                    decoration: BoxDecoration(
                      color: Color(0xff1F88DD),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: 80,
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
                                "Teacher Dashboard",
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
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Text("Welcome " + user.email!,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                  fontSize: 18)),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                  child: Container(
                    height: 180,
                    width: 450,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.pink[50]),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SmallButton(
                              data: 'View Attendance',
                              color: Color(0xffE53173),
                              onTap: () {
                                Navigator.pushNamed(context, '/viewattendance');
                              }),
                          SmallButton(
                              data: 'Add Attendance',
                              color: Color(0xffE53173),
                              onTap: () {
                                //nothihng
                              }),
                          SmallButton(
                              data: 'Edit Attendance',
                              color: Color(0xffE53173),
                              onTap: () {
                                //nothihng
                              }),
                        ]),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                  child: Container(
                    height: 180,
                    width: 450,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.blue[50]),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SmallButton(
                              data: 'View Students',
                              color: Color(0xff1F88DD),
                              onTap: () {
                                Navigator.pushNamed(context, '/viewstudents');
                              }),
                          SmallButton(
                              data: 'Add Students',
                              color: Color(0xff1F88DD),
                              onTap: () {
                                Navigator.pushNamed(context, '/addstudents');
                              }),
                          SmallButton(
                              data: 'Edit Students',
                              color: Color(0xff1F88DD),
                              onTap: () {
                                //nothihng
                              }),
                        ]),
                  ),
                ),
              ],
            )
          ],
        ));
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
      actions: [
        IconButton(onPressed: signUserOut, icon: Icon(Icons.logout)),
      ],
    );
  }
}
