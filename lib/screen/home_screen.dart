import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_json_task/screen/secound_input.dart';
import 'package:flutter_json_task/screen/secound_task.dart';

import 'first_input.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Json Task"),
        centerTitle: true,
        elevation: 1,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.0, top: 5),
              child: Text(
                'Input-1  :',
                style: TextStyle(color: Colors.blue, fontSize: 18),
              ),
            ),
            Expanded(
              child: JsonGridView(),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0,),
              child: Text(
                'Input-2  :',
                style: TextStyle(color: Colors.blue, fontSize: 18),
              ),
            ),
            Expanded(
              child: JsonGridViewScreen(),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment:MainAxisAlignment.spaceBetween,
                children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => JsonGridView()),
                    );
                  },
                  child: Text("Input-1"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue, // Set the background color
                    foregroundColor: Colors.white, // Set the text color
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12), // Adjust padding
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10), // Round corners
                    ),
                  ),
                ),
                SizedBox(width: 5,),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => JsonGridViewScreen()),
                    );
                  },
                  child: Text("Input-2"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue, // Set the background color
                    foregroundColor: Colors.white, // Set the text color
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12), // Adjust padding
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10), // Round corners
                    ),
                  ),
                ),
                SizedBox(width: 5,),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => JsonParserWidget()),
                    );
                  },
                  child: Text("Task 2"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue, // Set the background color
                    foregroundColor: Colors.white, // Set the text color
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12), // Adjust padding
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10), // Round corners
                    ),
                  ),
                ),
              ],),
            ),
          ],
        ),
      ),
    );
  }
}
