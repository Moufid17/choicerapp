import 'package:choicerapp/choice_item.dart';
import 'package:choicerapp/core/models/choice.dart';
import 'package:choicerapp/main.dart';
import 'package:choicerapp/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Footer extends StatefulWidget {
  final Function(Choice, bool) updateElement;

  const Footer({super.key, required this.updateElement});

  @override
  State<Footer> createState() => _FooterState();
}

class _FooterState extends State<Footer> {

  void updateHeaderData (Choice value, bool isAdd) {
    setState(() {
      widget.updateElement(value, isAdd);
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    bool isLight = themeProvider.customTheme == 'light';
    // Init header elements
    List<Choice> footerElement = [
      Choice(title: 'Cinéma', description: 'Cinéma description'),
      Choice(title: 'Pétanque', description: 'Pétanque description'),
      Choice(title: 'Fitness', description: 'Fitness description'),
      Choice(title: 'League of legends', description: 'League of legends description'),
      Choice(title: 'Basket', description: 'Basket description'),
      Choice(title: 'Shopping', description: 'Shopping description'),
      Choice(title: 'Programmation', description: 'Programmation description'),
    ];
    return Stack(
      children: [
        Container(
          color: themeProvider.customTheme == 'light' ? Colors.white : Colors.black54,
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
                ...footerElement.map((element) => ChoiceItem(isOpen: false, element: element, updateElement: updateHeaderData)),
              ]),
        ),
      ],
    );
  }
}
