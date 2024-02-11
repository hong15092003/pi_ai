import 'package:flutter/material.dart';


class HandleData extends ChangeNotifier {
  List<Map<dynamic, String>> contents = [];
  void addContent(String content, String role) {
    contents.add(
      {"content": content, "role": role},
    );
    notifyListeners();
  }

  void clearContent() {
    contents.clear();
    notifyListeners();
  }

  void removeContent(int index) {
    contents.removeAt(index);
    notifyListeners();
  }

  void updateContent(int index, String content, String role) {
    contents[index] = {"content": content, "role": role};
    notifyListeners();
  }

  String getContent(int index) {
    return contents[index]['content'].toString();
  }

  bool isRoleUser(int index) {
    return contents[index]['role'] == 'user';
  }
}

// Tạo một thể hiện toàn cục của HandleData
HandleData handleData = HandleData();
