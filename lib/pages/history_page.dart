import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pi_ai/components/buttton/back_home_button.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final fullHeight = MediaQuery.of(context).size.height;
    // final fullWidth = MediaQuery.of(context).size.width;
    return Center(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              child: Container(
                alignment: Alignment.bottomCenter,
                padding: const EdgeInsets.only(bottom: 35, right: 10, left: 20),
                height: fullHeight,
                // width: 50,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                  border: Border(
                    right: BorderSide(
                      color: Colors.blue.withOpacity(0.1),
                      width: 2,
                    ),
                  ),
                  borderRadius: const BorderRadius.only(
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
