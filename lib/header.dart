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
        const Padding(
          padding: EdgeInsets.all(8),
          child: Wrap(
              spacing: 4, // Espacement horizontal
              runSpacing: 6, // Espacement vertical
              children: [
                //ChoiceItem(isTap: false, title: 'cinema'),
                Text('User'),
                Text('User1'),
              ]
          ),
        ),
      ],
    );
  }
}
