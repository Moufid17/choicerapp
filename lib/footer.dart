import 'package:choicerapp/choice_item.dart';
import 'package:flutter/material.dart';

class Footer extends StatefulWidget {
  final Function(String, bool) addElement;
  const Footer({super.key, required this.addElement});

  @override
  State<Footer> createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  void addElementToHeader (String value, bool isAdd) {
    setState(() {
      widget.addElement(value, isAdd);
    });
  }
  @override
  Widget build(BuildContext context) {
    List<String> footerElement = ["cinema", "pétanque", 'fitness', 'League of legends', 'basket', 'shopping', 'programmation'];
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
              spacing: 8, // Espacement horizontal
              runSpacing: 8, // Espacement vertical
              children: [
                for (var element in footerElement) ChoiceItem(isTap: true, title: element, addElement: addElementToHeader),
              ]),
        ),
      ],
    );
  }
}
