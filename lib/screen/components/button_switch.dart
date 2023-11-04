import 'package:choicerapp/globals.dart';
import 'package:choicerapp/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ButtonSwitch extends StatefulWidget {
  const ButtonSwitch({super.key});

  @override
  State<ButtonSwitch> createState() => _ButtonSwitchState();
}

class _ButtonSwitchState extends State<ButtonSwitch> {


  final MaterialStateProperty<Icon?> thumbIcon =
  MaterialStateProperty.resolveWith<Icon?>(
    (Set<MaterialState> states) {
      if (states.contains(MaterialState.selected)) {
        return const Icon(Icons.nightlight_round);
      }
      return const Icon(Icons.brightness_5);
    },
  );

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    bool isLight = themeProvider.customTheme == 'light';
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Switch(
          thumbIcon: thumbIcon,
          value: isLight,
          onChanged: (bool value) {
            setState(() {
              isLight = value;
              Globals.customTheme = 'dark';
              themeProvider.switchTheme(value);
            });
          },
        ),
      ],
    );
  }
}