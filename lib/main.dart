import 'package:choicerapp/core/models/choice.dart';
import 'package:choicerapp/footer.dart';
import 'package:choicerapp/globals.dart';
import 'package:choicerapp/header.dart';
import 'package:choicerapp/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  //runApp(const MyApp());
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()), // Ajoutez votre gestionnaire d'état ici
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  List<Choice> headerElement = [];
  void updateHeaderData(Choice value, bool isAdd) {
    setState(() {
      // Add Element
      if (isAdd) {
        headerElement.add(value);
      // Pop Element
      } else {
        // Filter header element with value
        headerElement = headerElement.where((element) => element.title != value.title).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Globals.customTheme = 'light';
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
