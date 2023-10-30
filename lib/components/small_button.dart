import 'package:flutter/material.dart';

class SmallButton extends StatelessWidget {
  final String data;
  final Function()? onTap;
  final Color? color;
  const SmallButton(
      {super.key,
      required this.data,
      required this.onTap,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: onTap, child: Container(child: button()));
  }

  Container button() {
    return Container(
      height: 40,
      width: 280,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: color,
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 0,
                spreadRadius: 0.0)
          ],
          borderRadius: BorderRadius.circular(50)),
      child: Center(
        child: Text(data,
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 22,
                color: Colors.white)),
      ),
    );
  }
}
