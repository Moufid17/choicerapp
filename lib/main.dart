import 'package:choicerapp/footer.dart';
import 'package:choicerapp/header.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<String> headerElement = [];
  void updateHeaderData(String value, bool isAdd) {
    setState(() {
      // Add Element
      if (isAdd) {
        headerElement.add(value);
      // Pop Element
      } else {
        // Filter header element with value
        headerElement = headerElement.where((element) => element != value).toList();
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
                    child: Header(elements: headerElement,)
                  ),
                  Expanded(
                      child: Footer(updateElement: updateHeaderData,)
                  ),
                ],
              ),
            )
        )
    );
  }
}
