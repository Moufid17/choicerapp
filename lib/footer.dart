import 'package:choicerapp/choice_item.dart';
import 'package:flutter/material.dart';

class Footer extends StatefulWidget {

  String h;
  final Function(String, bool) addElement;
  Footer({super.key, required this.h, required this.addElement});

  @override
  State<Footer> createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  void addElementToHeader (String value, bool isAdd) {
    setState(() {
      widget.addElement(value, isAdd);
      widget.h = value;
    });
  }
  @override
  Widget build(BuildContext context) {
    List<String> footerElement = ["cinema", "pétanque", 'fitness'];
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
                for (var element in footerElement) ChoiceItem(isTap: true, title: element, addElement: addElementToHeader),
              ]),
        ),
      ],
    );
  }
}
