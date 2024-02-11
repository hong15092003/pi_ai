// lib/controller/add_chat.dart
import 'package:flutter/material.dart';

class TextFiledController extends ChangeNotifier {
  bool _isOnTap = false;
  TextEditingController _controller = TextEditingController();
  void clear() {
    _controller.clear();
  }

  dynamic get content => _controller.text;
  get controller => _controller;

  set controller(dynamic value) {
    _controller = value;
  }

  bool get isOnTap => _isOnTap;
  set isOnTap(bool value) {
    _isOnTap = value;
    notifyListeners();
  }
}

// Tạo một thể hiện toàn cục của AddChat
TextFiledController textFiledController = TextFiledController();
