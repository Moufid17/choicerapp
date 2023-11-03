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
          child: Wrap(
              spacing: 4, // Espacement horizontal
              runSpacing: 6, // Espacement vertical
              children: [
                for (var element in elements) ChoiceItem(isTap: false, title: element,),
              ]
          ),
        ),
      ],
    );
  }
}
