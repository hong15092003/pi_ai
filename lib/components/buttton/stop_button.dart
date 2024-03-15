import 'package:flutter/material.dart';

import 'aaa_circle_button.dart';

class StopButton extends StatefulWidget {
  const StopButton({Key? key}) : super(key: key);

  @override
  State<StopButton> createState() => _SendButtonState();
}

class _SendButtonState extends State<StopButton> {
  @override
  Widget build(BuildContext context) {
    return CircleButton(
      icon: Icons.stop_circle_rounded,
      onPressed: () {},
    );
  }
}
