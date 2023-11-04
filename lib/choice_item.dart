import 'package:flutter/material.dart';

class ChoiceItem extends StatefulWidget {
  bool isTap = false;
  String title;
  final Function(String, bool)? updateElement;

  ChoiceItem({super.key, required this.isTap, required this.title, this.updateElement});

  @override
  State<ChoiceItem> createState() => _ChoiceItemState();
}

class _ChoiceItemState extends State<ChoiceItem> {
  // Init element color
  Color _color = Colors.grey;
  // Toggle when an element is tapped.
  void _toggleElementColorAndUpdateHeaderElement() {
    if (widget.isTap) {
      setState(() {
        // Check if update method is defined by ChoiceItem Parent widget
        if (widget.updateElement != null) {
          // Adding State
          if (_color == Colors.yellow ) {
            _color = Colors.grey;
            widget.updateElement!(widget.title, false);
          // Removing State
          } else {
            _color = Colors.yellow;
            widget.updateElement!(widget.title, true);
          }
        }
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _toggleElementColorAndUpdateHeaderElement();
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: _color,
        ),
        // Change button text when light changes state.
        child: Text(widget.title),
      ),
    );
  }
}
