import 'dart:convert';

import 'package:flutter/material.dart';

class JsonGridView extends StatelessWidget {
  final String jsonString = '''
  [
    {"0":{"id":1,"title":"Gingerbread"},"1":{"id":2,"title":"Jellybean"},"3":{"id":3,"title":"KitKat"}},
    [{"id":4,"title":"Lollipop"},{"id":5,"title":"Pie"},{"id":6,"title":"Oreo"},{"id":7,"title":"Nougat"}]
  ]
  ''';

  @override
  Widget build(BuildContext context) {
    // Parse JSON string to a list of maps/lists
    List<dynamic> jsonList = jsonDecode(jsonString);

    // Extract titles from the JSON
    List<String> titles = [];
    for (var item in jsonList) {
      if (item is Map) {
        item.values.forEach((value) {
          if (value is Map) {
            titles.add(value['title']);
          }
        });
      } else if (item is List) {
        for (var subItem in item) {
          if (subItem is Map) {
            titles.add(subItem['title']);
          }
        }
      }
    }

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // Number of items per row
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 2, // Aspect ratio for the grid items
        ),
        itemCount: titles.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Center(
              child: Text(
                titles[index],
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
