import 'package:flutter/material.dart';
import 'package:pi_ai/components/buttton/add_button.dart';
import 'package:pi_ai/components/buttton/menu_button.dart';
import 'package:pi_ai/components/chat_box.dart';
import 'package:pi_ai/components/chats_view.dart';
import 'package:pi_ai/components/buttton/send_button.dart';
import 'package:pi_ai/controller/controler_components/text_filed_controller.dart';
import 'package:pi_ai/pages/history_page.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isKeyboardShown(BuildContext context) {
    if (MediaQuery.of(context).viewInsets.bottom > 300) return true;
    bool isKeyboard = MediaQuery.of(context).viewInsets.bottom > oldPadding;
    oldPadding = MediaQuery.of(context).viewInsets.bottom;
    return isKeyboard;
  }

  double oldPadding = 0;

  @override
  Widget build(BuildContext context) {
    textFiledController = context.watch<TextFiledController>();
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 10, 10, 10),
      drawer: const HistoryPage(),
      body: Center(
        child: Stack(
          children: [
            const Align(
              alignment: Alignment.center,
              child: Text(
                'PIAI',
                style: TextStyle(
                  fontSize: 80,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(46, 46, 46, 0.247),
                ),
              ),
            ),
            const ChatsView(),

            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                color: Colors.black.withOpacity(0.9),
                padding: EdgeInsets.only(
                    bottom: isKeyboardShown(context) ? 10 : 30,
                    left: 20,
                    right: 20,
                    top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if (!textFiledController.isOnTap)
                      const Row(
                        children: [
                          MenuButton(),
                          SizedBox(width: 10),
                          AddButton(),
                          SizedBox(width: 10),
                        ],
                      ),
                    const Expanded(
                      child: ChatBox(),
                    ),
                    const SizedBox(width: 10),
                    const SendButton(),
                  ],
                ),
              ),
            ),
            // const Positioned(top: 0, left: 0, right: 0, child: TopBar()),
          ],
        ),
      ),
    );
  }
}
