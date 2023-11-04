import 'package:choicerapp/core/models/choice.dart';
import 'package:choicerapp/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChoiceItemDetailScreen extends StatelessWidget {
  final Choice elementDetail;
  const ChoiceItemDetailScreen({super.key, required this.elementDetail});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final Color bgColor   =   themeProvider.customTheme == 'light' ? Colors.grey : Colors.black;
    final Color textColor =   themeProvider.customTheme == 'light' ? Colors.black : Colors.white;
    final Color btnColor  =   themeProvider.customTheme == 'light' ? Colors.white : Colors.black;
    const double textSize =   20;
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Container(
            height: double.infinity,
            width: double.infinity,
            color: bgColor,
            padding: const EdgeInsets.all(8),
            child: Wrap(
              spacing: 16,
              direction: Axis.vertical,
              children: [
                Wrap(
                  children: [
                    Text('Title : ',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: textSize, color: textColor),
                    ),
                    Text(elementDetail.title,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: textSize, color: textColor),
                    ),
                  ],
                ),
                Wrap(
                  children: [
                    Text('Description : ',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: textSize, color: textColor),
                    ),
                    Text(elementDetail.description,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: textSize, color: textColor),
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
                      color: textColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    // Change button text when light changes state.
                    child: Text('Retour',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: btnColor, fontSize: 24,),
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
