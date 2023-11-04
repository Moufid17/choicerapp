import 'package:choicerapp/core/models/choice.dart';
import 'package:choicerapp/screen/choice_item_detail_screen.dart';
import 'package:flutter/material.dart';

class ChoiceItem extends StatefulWidget {
  final bool isOpen; // Can open element details
  //final String title;
  final Choice element;
  final void Function(Choice, bool)? updateElement;

  const ChoiceItem({super.key, required this.isOpen, required this.element, this.updateElement});

  @override
  State<ChoiceItem> createState() => _ChoiceItemState();
}

class _ChoiceItemState extends State<ChoiceItem> {
  // Init element color
  Color _color = Colors.grey;
  // Toggle when an element is tapped.
  void _toggleElementColorAndUpdateHeaderElement() {
    setState(() {
      // Check if update method is defined by ChoiceItem Parent widget
      if (widget.updateElement != null) {
        // Adding State
        if (_color == Colors.yellow ) {
          _color = Colors.grey;
          widget.updateElement!(widget.element, false);
        // Removing State
        } else {
          _color = Colors.yellow;
          widget.updateElement!(widget.element, true);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    //Choice elementDetail = Choice(title: 'Basket', description: 'Basket Desc');
    return GestureDetector(
      onTap: () {
        // Open details page
        if (widget.isOpen) {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => ChoiceItemDetailScreen(elementDetail: widget.element,))
          );
        // Open details page
        } else {
          _toggleElementColorAndUpdateHeaderElement();
        }
        
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: _color,
        ),
        // Change button text when light changes state.
        child: Text(widget.element.title,
            style: widget.isOpen ? const TextStyle(color: Colors.white) : null
        ),
      ),
    );
  }
}
