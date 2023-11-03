import 'package:flutter/material.dart';

import 'choice_item.dart';

class Header extends StatelessWidget {
  List<String> elements;

  Header({super.key, required this.elements});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.purple,
        ),
        Padding(
          padding: EdgeInsets.all(8),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Vos choix :',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 36),
                ),
                if (elements.isEmpty)
                  const Text('Cliquez sur les choix ci-dessous !')
                else
                  Wrap(
                  spacing: 4, // Espacement horizontal
                  runSpacing: 6, // Espacement vertical
                  children: [
                    ...elements.map((element) => ChoiceItem(isTap: false, title: element))]
                  ),
              ]
          ),
        ),
      ],
    );
  }
}
