import 'package:firebase/pages/features/auth_page.dart';
import 'package:firebase/pages/presentation/Attendance/viewattendance.dart';
import 'package:firebase/pages/presentation/CRUD/addstudents.dart';
import 'package:firebase/pages/presentation/CRUD/viewstudents.dart';
import 'package:firebase/pages/presentation/home.dart';
//import 'package:firebase/pages/presentation/loginpage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Firebase',
      debugShowCheckedModeBanner: false,
      routes: {
        '/auth': (context) => AuthPage(),
        '/addstudents': (context) => AddStudents(),
        '/viewstudents': (context) => ViewStudents(),
        '/viewattendance': (context) => ViewAttendance(),
      },
      theme: ThemeData(fontFamily: 'Poppins'),
      home: HomePage(),
    );
  }
}
