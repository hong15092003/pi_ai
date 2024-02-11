import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:pi_ai/controller/controler_components/text_filed_controller.dart';
import 'package:pi_ai/controller/controller_api/controller_api.dart';
import 'package:pi_ai/controller/controller_data/handle_data.dart';

import 'aaa_circle_button.dart';

class AddButton extends StatefulWidget {
  const AddButton({Key? key}) : super(key: key);

  @override
  State<AddButton> createState() => _SendButtonState();
}

class _SendButtonState extends State<AddButton> {
  @override
  Widget build(BuildContext context) {
    final handleData = context.read<HandleData>();
    return CircleButton(
      icon: Icons.add,
      onPressed: () {
        if (handleData.contents.isNotEmpty) {
          handleData.clearContent();
          textFiledController.clear();
          controllerAPI.clearContentBody();
        }
      },
    );
  }
}
