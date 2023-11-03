import 'package:flutter/material.dart';

import 'choice_item.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.purple,
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: Row(

              children: [
                ChoiceItem(isTap: false, title: 'cinema'),
                ChoiceItem(isTap: false, title: 'pétanque'),
                ChoiceItem(isTap: false, title: 'fitness'),
              ]
          ),
        ),
      ],
    );
  }
}
