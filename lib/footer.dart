import 'package:choicerapp/choice_item.dart';
import 'package:flutter/material.dart';

class Footer extends StatefulWidget {
  final Function(String) addElement;
  String h;
  Footer({super.key, required this.h, required this.addElement});

  @override
  State<Footer> createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  void addElementToHeader (String value) {
    setState(() {
      widget.addElement(value);
      widget.h = value;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.white,
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: Wrap(
              //alignment: WrapAlignment.spaceAround,
              //runAlignment: WrapAlignment.spaceEvenly,
              spacing: 4, // Espacement horizontal
              runSpacing: 6, // Espacement vertical
              children: [
                ChoiceItem(isTap: true, title: 'cinema', addElement: addElementToHeader),
                //ChoiceItem(isTap: true, title: 'pétanque', addElement),
                //ChoiceItem(isTap: true, title: 'fitness', addElement),
              ]),
        ),
      ],
    );
  }
}
