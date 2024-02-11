import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pi_ai/controller/controller_data/handle_data.dart';

class ControllerAPI {
  final _apiKey = "AIzaSyCGujlLQjjpEfid13hvw3wYX3gjbN482M4";
  final _baseURL =
      "https://generativelanguage.googleapis.com/v1/models/gemini-pro:generateContent?key=";
  final Map<String, dynamic> _body = {
    "contents": [],
    "generationConfig": {
      "temperature": 1,
      "topK": 10,
      "topP": 1,
      "maxOutputTokens": 2048,
      "stopSequences": []
    },
    "safetySettings": [
      {
        "category": "HARM_CATEGORY_HARASSMENT",
        "threshold": "BLOCK_MEDIUM_AND_ABOVE"
      },
      {
        "category": "HARM_CATEGORY_HATE_SPEECH",
        "threshold": "BLOCK_MEDIUM_AND_ABOVE"
      },
      {
        "category": "HARM_CATEGORY_SEXUALLY_EXPLICIT",
        "threshold": "BLOCK_MEDIUM_AND_ABOVE"
      },
      {
        "category": "HARM_CATEGORY_DANGEROUS_CONTENT",
        "threshold": "BLOCK_MEDIUM_AND_ABOVE"
      }
    ]
  };

  dynamic callAPI() async {
    return http.post(
      Uri.parse('$_baseURL+$_apiKey'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(_body),
    );
    // debugPrint(request.body);
    // try {
    //   if (request.statusCode == 200) {
    //     return request.body;
    //   } else {
    //     return request.statusCode.toString();
    //   }
    // } catch (e) {
    //   return e.toString();
    // }
  }

  void handleAPI(content, role) async {
    addContentBody(content, role);
    final request = await http.post(
      Uri.parse('$_baseURL+$_apiKey'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(_body),
    );
    dynamic response = jsonDecode(request.body);
    response = response['candidates']?[0]['content']['parts'][0]['text'];
    handleAfter(response, 'Model');
  }

  void addContentBody(String content, String role) {
    _body["contents"].add({
      "role": role,
      "parts": [
        {"text": content}
      ]
    });
  }

  void handleAfter(content, role) {
    addContentBody(content, role);
    handleData.addContent(content, role);
  }

  void clearContentBody() {
    _body["contents"].clear();
  }
}

ControllerAPI controllerAPI = ControllerAPI();
