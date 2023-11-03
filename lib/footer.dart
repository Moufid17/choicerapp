import 'package:choicerapp/choice_item.dart';
import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

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
                ChoiceItem(isTap: true, title: 'cinema'),
                ChoiceItem(isTap: true, title: 'pétanque'),
                ChoiceItem(isTap: true, title: 'fitness'),
              ]),
        ),
      ],
    );
  }
}
