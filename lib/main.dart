import 'package:choicerapp/footer.dart';
import 'package:choicerapp/header.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

List<String> headerElement = [];

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void addElementToHeader(String value, bool isAdding) {
    setState(() {
      if (isAdding) {
        headerElement.add(value);
      } else {
        headerElement = headerElement.where((e) => e != value).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: SafeArea(
              child: Column(
                children: [
                  Expanded(
                    child: Header(
                      elements: headerElement,
                    )
                  ),
                  Expanded(child: Footer(addElement: addElementToHeader)),
                ],
              ),
    )));
  }
}
