import 'package:flutter/material.dart';

class CircleButton extends StatefulWidget {
  final IconData? icon;
  final dynamic onPressed;
  const CircleButton({Key? key, this.icon, this.onPressed}) : super(key: key);

  @override
  State<CircleButton> createState() => _SendButtonState();
}

class _SendButtonState extends State<CircleButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 30,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.blue,
        boxShadow: [
          BoxShadow(
            color: Colors.blue,
            blurRadius: 10.0,
            spreadRadius: 0.0,
            // offset: Offset(2.0, 2.0), // shadow direction: bottom right
          )
        ],
      ),
      child: IconButton(
        color: Colors.white,
        icon: Icon(widget.icon, size: 13),
        onPressed: () {
          widget.onPressed();
        },
      ),
    );
  }
}
