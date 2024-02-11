import 'package:flutter/material.dart';
import 'package:localstore/localstore.dart';
import 'package:pi_ai/controller/controler_components/text_filed_controller.dart';
import 'package:pi_ai/controller/controller_data/handle_data.dart';
import 'package:provider/provider.dart';
import '/pages/home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => handleData),
      ChangeNotifierProvider(create: (_) => textFiledController),
    ],
    child: const MyApp(),
  ));
  final db = Localstore.instance;
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ThemeData(
      primarySwatch: Colors.blue,
    );
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}
