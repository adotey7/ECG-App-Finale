import 'package:flutter/material.dart';

class CustomRoundIcons extends StatefulWidget {
  CustomRoundIcons(
      {Key? key, required this.icon, required this.onPressed, this.color})
      : super(key: key);
  IconData icon;
  VoidCallback onPressed;
  Color? color;

  @override
  State<CustomRoundIcons> createState() => _CustomRoundIconsState();
}

class _CustomRoundIconsState extends State<CustomRoundIcons> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: widget.onPressed,
      icon: Icon(
        widget.icon,
        color: widget.color,
        size: 40,
      ),
    );
  }
}
