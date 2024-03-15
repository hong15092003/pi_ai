import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'aaa_circle_button.dart';
import 'package:pi_ai/controller/controler_components/text_filed_controller.dart';
import 'package:pi_ai/controller/controller_api/controller_api.dart';
import 'package:pi_ai/controller/controller_data/handle_data.dart';

class SendButton extends StatefulWidget {
  const SendButton({Key? key}) : super(key: key);

  @override
  State<SendButton> createState() => _SendButtonState();
}

class _SendButtonState extends State<SendButton> {
  @override
  Widget build(BuildContext context) {
    final handleData = context.read<HandleData>();
    return CircleButton(
        icon: Icons.arrow_upward_rounded,
        onPressed: () {
          if (textFiledController.content != '') {
            controllerAPI.loading = true;
            handleData.addContent(textFiledController.content, 'user');
            controllerAPI.handleAPI(textFiledController.content, 'user');
            textFiledController.clear();
          }
        });
  }
}
