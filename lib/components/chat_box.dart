import 'package:flutter/material.dart';
import 'package:pi_ai/controller/controler_components/text_filed_controller.dart';
import 'package:provider/provider.dart';

class ChatBox extends StatefulWidget {
  const ChatBox({Key? key}) : super(key: key);

  @override
  State<ChatBox> createState() => _ChatBoxState();
}

class _ChatBoxState extends State<ChatBox> {
  // final TextEditingController _controller = TextEditingController();

  // @override
  // void initState() {
  //   super.initState();
  //   _controller.addListener(() {
  //     textFiledController.controller = _controller;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    textFiledController = context.read<TextFiledController>();
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(25),
      ),
      child: TextField(
        controller: textFiledController.controller,
        minLines: 1,
        maxLines: 3,
        onTap: () {
          textFiledController.isOnTap = true;
        },
        onTapOutside: (i) {
          textFiledController.isOnTap = false;
        },
        decoration: const InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          hintText: 'Nhập câu hỏi...',
          hintStyle: TextStyle(color: Colors.white, fontSize: 15),
          contentPadding:
              EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
        ),
        style: const TextStyle(
          color: Colors.white,
          fontSize: 15,
        ),
      ),
    );
  }
}
