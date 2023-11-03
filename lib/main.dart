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

  String titleD = '';

  void addElementToHeader (String value, bool isAdding) {
    setState(() {
      titleD = value;
      if (isAdding) {
        print("IsAdding => $isAdding | Elements => $headerElement");
        headerElement.add(value);
      } else {
        headerElement = headerElement.where((e) => e != value).toList();
        print("IsAdding => $isAdding | Elements => $headerElement");
      }
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
                  color: Colors.yellow,
                  child: Center(child: Text(titleD)),
                )
            ),
            Expanded(child: Header(elements: headerElement,)),
            Expanded(child: Footer(h: titleD, addElement: addElementToHeader)),
          ],
        ),
      )
    );
  }
}
