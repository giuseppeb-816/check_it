//Page where user can view their total score and goal history

import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    title: 'Navigation Basics',
    home: FirstRoute(),
  ));
}

class FirstRoute extends StatelessWidget {
  const FirstRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrangeAccent,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Profile'),
      ),
      body: Center(
        child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
              decoration: new BoxDecoration(
                color: Colors.lightGreenAccent,
              ),
              child: Text(
                "Christopher",
                style: TextStyle(fontSize: 50),
              ),
          ),
          Container(
            decoration: new BoxDecoration(
              color: Colors.lightGreenAccent,
            ),
            child: Text(
              "Score: 102",
              style: TextStyle(fontSize: 50),
            ),
          ),
          Container(
            decoration: new BoxDecoration(
              color: Colors.lightGreenAccent,
            ),
            child: Text(
              "Streak 5",
              style: TextStyle(fontSize: 50),
            ),
          ),
          ElevatedButton(onPressed: () {}, child: Text("Back")),
          ],
        ),
      ),
    );
  }
}