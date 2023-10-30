import 'package:flutter/material.dart';
import 'package:firebase/components/read_data/get_class.dart';

class MyDropdownPage extends StatefulWidget {
  @override
  _MyDropdownPageState createState() => _MyDropdownPageState();
}

class _MyDropdownPageState extends State<MyDropdownPage> {
  String? selectedValue;

  final List<String> dropdownItems = ['Maths', 'Science', 'English'];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Selected Value: ${selectedValue ?? 'None'}'),
          SizedBox(height: 5),
          Center(
            child: Container(
              width: 300,
              child: DropdownButton<String>(
                value: selectedValue,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedValue = newValue;
                  });
                },
                items: dropdownItems.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value,
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black87,
                            fontWeight: FontWeight.w400)),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
