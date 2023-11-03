import 'package:flutter/material.dart';

class ChoiceItem extends StatefulWidget {
  bool isTap = false;
  String title;

  ChoiceItem({super.key, required this.isTap, required this.title});

  @override
  State<ChoiceItem> createState() => _ChoiceItemState();
}

class _ChoiceItemState extends State<ChoiceItem> {
  Color _color = Colors.grey;
  void _changeColor() {
    if (widget.isTap) {
      setState(() {
        // Toggle light when tapped.
        // widget.isTap = !widget.isTap;
        _color = _color == Colors.grey ? Colors.yellow : Colors.grey;
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
