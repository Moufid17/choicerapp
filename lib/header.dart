import 'package:flutter/material.dart';
import 'choice_item.dart';

class Header extends StatelessWidget {
  List<String> elements = [];

  Header({super.key, required this.elements});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.deepPurpleAccent,
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Vos choix :',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 36
                ),
              ),
              if (elements.isEmpty)
                const Text('Cliquez sur les choix ci-dessous !',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18
                  ),
                )
              else
                Wrap(
                    spacing: 4, // Espacement horizontal
                    runSpacing: 6, // Espacement vertical
                    children: [
                      // Spread header elements as ChoiceItem
                      ...elements.map((element) => ChoiceItem(isTap: false, title: element))
                    ]  // Wrap Children
                ),
            ],  // Column Children
          ),
        ),
      ], // Stack Children
    );
  }
}
