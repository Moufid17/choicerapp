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
  List<String> footerElement = ["cinema", "pétanque", 'fitness'];
  String titleD = '';

  void addElementToHeader (String value) {
    setState(() {
      titleD = value;
    });
  }
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Expanded(

                child: Container(
                  width: double.infinity,
                  color: Colors.purple,
                  child: Center(child: Text(titleD)),
                )
            ),
            //const Expanded(child: Header()),
            Expanded(child: Footer(h: titleD, addElement: addElementToHeader)),
          ],
        ),
      )
    );
  }
}
