import 'package:flutter/material.dart';

class ChoiceItem extends StatefulWidget {
  bool isTap = false;
  String title;
  final Function(String, bool)? addElement;

  ChoiceItem({super.key, required this.isTap, required this.title, this.addElement});

  @override
  State<ChoiceItem> createState() => _ChoiceItemState();
}

class _ChoiceItemState extends State<ChoiceItem> {
  Color _color = Colors.grey;
  void _changeColor() {
    if (widget.isTap) {
      setState(() {
        // widget.isTap = !widget.isTap;
        // Toggle light when tapped.
        _color = _color == Colors.grey ? Colors.yellow : Colors.grey;
        final String value =  widget.title;
        if (widget.addElement != null) {
          if (_color == Colors.yellow ) {
            widget.addElement!(value, true);
          } else {
            widget.addElement!(value, false);
          }
        }
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _changeColor();
      },
      child: Container(
        color: _color,
        padding: const EdgeInsets.all(8),
        // Change button text when light changes state.
        child: Text(widget.title),
      ),
    );
  }
}
