import 'package:containerselection/container_selection.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      title: 'Container Selection',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Container Selection'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              Center(
                child: ContainerSelection(
                  initialIndex: 0,
                  children: ["Option 1", "Option 2", "Option 3"],
                  duration: Duration(milliseconds: 250),
                  backgroundColor: Colors.black,
                  padding: 1,
                  selectedColor: Colors.red,
                  radius: 10,
                  unSelectedTextStyle: TextStyle(color: Colors.white),
                  selectedTextStyle: TextStyle(color: Colors.black),
                ),
              ),
              Center(
                child: ContainerSelection(
                  initialIndex: 0,
                  children: ["Option 1", "Option 2", "Option 3"],
                  duration: Duration(milliseconds: 100),
                  backgroundColor: Colors.white,
                  padding: 3,
                  selectedColor: Colors.purple,
                  radius: 20,
                  unSelectedTextStyle: TextStyle(color: Colors.black),
                  selectedTextStyle: TextStyle(color: Colors.white),
                ),
              ),
              Center(
                child: ContainerSelection(
                  initialIndex: 0,
                  children: ["Option 1", "Option 2", "Option 3"],
                  duration: Duration(milliseconds: 500),
                  backgroundColor: Color(0xBB9FA3DD),
                  padding: 3,
                  selectedColor: Color(0xBBFFFFFF),
                  curve: Curves.bounceOut,
                  radius: 2,
                  unSelectedTextStyle: TextStyle(color: Colors.white),
                  selectedTextStyle: TextStyle(color: Colors.black),
                ),
              ),
              Center(
                child: ContainerSelection(
                  initialIndex: 0,
                  children: ["Option 1", "Option 2", "Option 3"],
                  duration: Duration(milliseconds: 500),
                  backgroundColor: Colors.grey,
                  curve: Curves.easeInOutBack,
                  padding: 1,
                  selectedColor: Colors.orange,
                  radius: 40,
                  unSelectedTextStyle: TextStyle(color: Colors.white),
                  selectedTextStyle: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
