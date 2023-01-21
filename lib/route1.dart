import 'package:flutter/material.dart';
import 'package:check_it/pages/SocialPage.dart';
import 'package:check_it/widget_tree.dart';
void main() {
  runApp(const MaterialApp(
    title: 'Navigation Basics',
    home: WidgetTree(),
  ));
}

class FirstRoute extends StatelessWidget {
  const FirstRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Route'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Open route'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SocialPageWidget()),
              );
          },
        ),
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  const SecondRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Route'),
      ),
      body: Center(
        child: ElevatedButton(
          // Within the SecondRoute widget
            onPressed: () {
              Navigator.pop(context);
            },
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}