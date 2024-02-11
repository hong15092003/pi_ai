import 'package:flutter/material.dart';

import 'aaa_circle_button.dart';

class BackHomeButton extends StatefulWidget {
  const BackHomeButton({Key? key}) : super(key: key);

  @override
  State<BackHomeButton> createState() => _SendButtonState();
}

class _SendButtonState extends State<BackHomeButton> {
  @override
  Widget build(BuildContext context) {
    return CircleButton(
      icon: Icons.arrow_back_rounded,
      onPressed: () {
        Scaffold.of(context).openEndDrawer();
      },
    );
  }
}
