import 'package:flutter/material.dart';

class RectangleIconButton extends StatelessWidget {
  final Icon icon;
  final void Function() callback;

  RectangleIconButton({required this.icon, required this.callback});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
              side: BorderSide(color: Colors.red)),
        ),
      ),
      onPressed: callback,
      child: icon,
    );
  }
}