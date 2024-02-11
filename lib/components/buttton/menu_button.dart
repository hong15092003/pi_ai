import 'package:flutter/material.dart';
import 'aaa_circle_button.dart';

class MenuButton extends StatefulWidget {
  const MenuButton({Key? key}) : super(key: key);

  @override
  State<MenuButton> createState() => _SendButtonState();
}

class _SendButtonState extends State<MenuButton> {
  @override
  Widget build(BuildContext context) {
    return CircleButton(
      icon: Icons.menu,
      onPressed: () {
        Scaffold.of(context).openDrawer();
      },
    );
  }
}
