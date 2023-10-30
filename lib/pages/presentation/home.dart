import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 60),
                  child: logo(),
                ),
              ),
              aksharpaaulheading(),
              SizedBox(
                height: 25,
              ),
              ngotext(),
              SizedBox(
                height: 35,
              ),
              GestureDetector(
                child: takeattendancebutton(),
                onTap: () {
                  Navigator.pushNamed(context, '/auth');
                },
              ),
            ]),
      ),
    );
  }

  Container logo() {
    return Container(
        height: 240,
        width: 240,
        child: Image.asset('assets/images/akshar paaul logo.png'));
  }

  Text aksharpaaulheading() {
    return Text(
      'Akshar Paaul',
      style: TextStyle(
          fontWeight: FontWeight.w600, fontSize: 30, color: Colors.black),
    );
  }

  Padding ngotext() {
    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 5),
      child: const Center(
        child: Text(
          "A social trust with the aim of spreading literacy amongst labour's children and brings them in the main stream of education who works on construction sites.",
          style: TextStyle(
              fontWeight: FontWeight.w400, fontSize: 17, color: Colors.black54),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Container takeattendancebutton() {
    return Container(
      height: 60,
      width: 300,
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Color(0xff1F88DD),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 10,
                spreadRadius: 1.0)
          ],
          borderRadius: BorderRadius.circular(50)),
      child: Center(
        child: Text('Take Attendance',
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 22,
                color: Colors.white)),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: const Text(
        'Akshar Paaul',
        style: TextStyle(
            color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
      ),
      backgroundColor: Colors.white,
      elevation: 1.5, //to remove the shadow of appbar
      centerTitle: true,
      leading: GestureDetector(
        onTap: () {},
        child: Container(
          margin: EdgeInsets.all(10),
          alignment: Alignment.center,
          child: SvgPicture.asset('assets/icons/search-svgrepo-com.svg'),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () {},
          child: Container(
            margin: EdgeInsets.all(10),
            alignment: Alignment.center,
            width: 37,
            child: SvgPicture.asset('assets/icons/three-dots-svgrepo-com.svg'),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
          ),
        )
      ],
    );
  }
}
