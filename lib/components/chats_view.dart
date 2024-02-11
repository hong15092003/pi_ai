import 'package:flutter/material.dart';
import 'package:pi_ai/components/mark_down.dart';
import 'package:pi_ai/controller/controller_data/handle_data.dart';
import 'package:provider/provider.dart';

class ChatsView extends StatefulWidget {
  const ChatsView({Key? key}) : super(key: key);

  @override
  State<ChatsView> createState() => _ChatsViewState();
}

class _ChatsViewState extends State<ChatsView> {
  void updateContents() {
    debugPrint('updateContents');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final handleData = context.watch<HandleData>();
    return ListView.builder(
      padding: const EdgeInsets.only(top: 80, bottom: 80),
      itemCount: handleData.contents.length,
      itemBuilder: (context, index) {
        return Align(
          alignment: handleData.isRoleUser(index)
              ? Alignment.centerRight
              : Alignment.centerLeft,
          child: Container(
            margin: handleData.isRoleUser(index)
                ? const EdgeInsets.only(
                    top: 10, left: 60, right: 10, bottom: 10)
                : const EdgeInsets.only(
                    top: 10, left: 10, right: 60, bottom: 10),
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color:
                  handleData.isRoleUser(index) ? Colors.blue : Colors.grey[900],
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color:
                      handleData.isRoleUser(index) ? Colors.blue : Colors.grey,
                  blurRadius: 5.0,
                  spreadRadius: 0.0,
                  // offset: Offset(2.0, 2.0), // shadow direction: bottom right
                )
              ],
            ),
            child: MarkDown(
              handleData.getContent(index),
            ),
            // child: Text(
            //   handleData.getContent(index),
            //   style: const TextStyle(
            //     color: Colors.white,
            //   ),
            // ),
          ),
        );
      },
    );
  }
}
