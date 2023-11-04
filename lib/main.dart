import 'package:choicerapp/core/models/choice.dart';
import 'package:choicerapp/footer.dart';
import 'package:choicerapp/header.dart';
import 'package:choicerapp/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      child: const MyApp(),
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
    return MaterialApp(
        theme: ThemeData(useMaterial3: true),
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
