import 'package:choicerapp/core/models/choice.dart';
import 'package:flutter/material.dart';

class ChoiceItemDetailScreen extends StatelessWidget {
  final Choice elementDetail;
  const ChoiceItemDetailScreen({super.key, required this.elementDetail});

  @override
  Widget build(BuildContext context) {
    const double textSize = 20;
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.grey,
            padding: const EdgeInsets.all(8),
            child: Wrap(
              //crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 16,
              //runSpacing: 16,
              direction: Axis.vertical,

              children: [
                Wrap(
                  children: [
                    const Text('Title : ',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: textSize),
                    ),
                    Text(elementDetail.title,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: textSize),
                    ),
                  ],
                ),
                Wrap(
                  children: [
                    const Text('Description : ',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: textSize),
                    ),
                    Text(elementDetail.description,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: textSize),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    // Back to Home
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    // Change button text when light changes state.
                    child: const Text('Retour',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 24,),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
