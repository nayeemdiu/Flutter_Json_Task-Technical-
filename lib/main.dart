// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:flutter_json_task/screen/first_input.dart';

// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(title: Text('Flutter JSON Task')),
//         body: JsonGridView(),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_json_task/screen/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}


