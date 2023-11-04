import 'package:choicerapp/choice_item.dart';
import 'package:flutter/material.dart';

class Footer extends StatefulWidget {
  final Function(String, bool) updateElement;

  const Footer({super.key, required this.updateElement});

  @override
  State<Footer> createState() => _FooterState();
}

class _FooterState extends State<Footer> {

  void updateHeaderData (String value, bool isAdd) {
    setState(() {
      widget.updateElement(value, isAdd);
    });
  }

  @override
  Widget build(BuildContext context) {
    // Init header elements
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
                // Spread footer elements as ChoiceItem
                ...footerElement.map((element) => ChoiceItem(isTap: true, title: element, updateElement: updateHeaderData)),
              ]),
        ),
      ],
    );
  }
}
