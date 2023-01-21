//Page where user can view their total score and goal history

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  List<int> top = <int>[];
  List<int> bottom = <int>[];
  List<String> goals = [
    "Run a mile",
    "eat sushi for the first time",
    "take a nap",
    "Go fishing",
    "Eat pie",
    "Finish math homework",
    "Take a walk",
    "Go to Starbucks"
  ];
  @override
  Widget build(BuildContext context) {
    const Key centerKey = ValueKey<String>('bottom-sliver-list');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Social Page'),
        backgroundColor: Colors.deepOrange[500],
        leading: IconButton(
          icon: const Icon(Icons.add),
          onPressed: () {
            if (bottom.length == 0) {
              for (var i = 0; i < goals.length; i++) {
                setState(() {
                  bottom.add(1);
                });
              }
            }
          },
        ),
      ),
      body: CustomScrollView(
        center: centerKey,
        slivers: <Widget>[
          SliverList(
            key: centerKey,
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                return Container(
                  alignment: Alignment.center,
                  color: index % 2 == 0 ? Colors.blue : Colors.yellow,
                  height: 100,
                  child: Column(
                    children: <Widget>[
                      Text('Goal: ${goals[index]}',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      Text('Owner: Chris'),
                    ],
                  ),
                );
              },
              childCount: bottom.length,
            ),
          ),
        ],
      ),
    );
  }
}