import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pi_ai/components/buttton/back_home_button.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final fullHeight = MediaQuery.of(context).size.height;
    final fullWidth = MediaQuery.of(context).size.width;
    return Center(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                alignment: Alignment.bottomCenter,
                padding: const EdgeInsets.only(bottom: 35, right: 20, left: 10),
                height: fullHeight,
                // width: 50,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(100, 35, 35, 35),
                  border: Border(
                    left: BorderSide(
                      color: Color.fromARGB(255, 35, 35, 35),
                      width: 2,
                    ),
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5),
                  ),
                ),
                child: const BackHomeButton(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
