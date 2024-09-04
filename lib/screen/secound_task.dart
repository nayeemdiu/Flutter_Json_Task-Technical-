import 'package:flutter/material.dart';

class JsonParserWidget extends StatelessWidget {
  final String jsonInput1 = '{"id": 1, "title": "Example 1"}';
  final String jsonInput2 = '{"id": 2, "title": "Example 2"}';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('JSON Parser',),centerTitle: true,),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text('Parse JSON 1'),
              onPressed: () => _showParsedJson(context, jsonInput1),
            ),
            SizedBox(width: 20),
            ElevatedButton(
              child: Text('Parse JSON 2'),
              onPressed: () => _showParsedJson(context, jsonInput2),
            ),
          ],
        ),
      ),
    );
  }

  void _showParsedJson(BuildContext context, String jsonString) {
    AndroidVerison parsedData = _parseJson(jsonString);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Parsed JSON'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('ID: ${parsedData.id}'),
            Text('Title: ${parsedData.title}'),
          ],
        ),
        actions: [
          TextButton(
            child: Text('Close'),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }

  AndroidVerison _parseJson(String jsonString) {
    // Manual JSON parsing
    jsonString = jsonString.trim();
    if (!jsonString.startsWith('{') || !jsonString.endsWith('}')) {
      throw FormatException('Invalid JSON format');
    }

    String content = jsonString.substring(1, jsonString.length - 1);
    List<String> pairs = content.split(',');
    Map<String, String> jsonMap = {};

    for (String pair in pairs) {
      List<String> keyValue = pair.split(':');
      if (keyValue.length != 2) continue;
      String key = keyValue[0].trim().replaceAll('"', '');
      String value = keyValue[1].trim().replaceAll('"', '');
      jsonMap[key] = value;
    }

    return AndroidVerison(
      int.tryParse(jsonMap['id'] ?? '') ?? 0,
      jsonMap['title'] ?? '',
    );
  }
}

class AndroidVerison {
  AndroidVerison(this.id, this.title);

  int? id;
  String? title;
}