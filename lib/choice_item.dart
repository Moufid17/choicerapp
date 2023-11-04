import 'package:choicerapp/core/models/choice.dart';
import 'package:choicerapp/globals.dart';
import 'package:choicerapp/screen/choice/choice_item_detail_screen.dart';
import 'package:choicerapp/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChoiceItem extends StatefulWidget {
  final bool isOpen; // Can open element details
  final Choice element;
  final void Function(Choice, bool)? updateElement;

  const ChoiceItem({super.key, required this.isOpen, required this.element, this.updateElement});

  @override
  State<ChoiceItem> createState() => _ChoiceItemState();
}

class _ChoiceItemState extends State<ChoiceItem> {
  Color _bgColor = Colors.yellow;
  // Toggle when an element is tapped.
  void toggleElementColorAndUpdateHeaderElement() {
    setState(() {
      // Check if update method is defined by ChoiceItem Parent widget
      if (widget.updateElement != null) {
        // Removing State
        if (_bgColor == Colors.grey ||  _bgColor == Colors.purple) {
          _bgColor = Colors.yellow;
          widget.updateElement!(widget.element, false);
          // Adding State
        } else {
          _bgColor =  Colors.grey;
          widget.updateElement!(widget.element, true);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Init element color
    final themeProvider = Provider.of<ThemeProvider>(context);
    Color bgColor =   _bgColor;
    if (_bgColor == Colors.grey || _bgColor == Colors.purple){
        bgColor = Colors.yellow;
    } else {
      if (themeProvider.customTheme == 'light') {
        bgColor = Colors.grey;
      } else {
        bgColor = Colors.purple;
      }
    }
    return GestureDetector(
      onTap: () {
        // Open details page
        if (widget.isOpen) {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => ChoiceItemDetailScreen(elementDetail: widget.element,))
          );
        // Open details page
        } else {
          toggleElementColorAndUpdateHeaderElement();
        }
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: bgColor,
        ),
        // Change button text when light changes state.
        child: Text(widget.element.title,
            style: TextStyle(color: widget.isOpen ?  Colors.white : Colors.black),
        ),
      ),
    );
  }
}
