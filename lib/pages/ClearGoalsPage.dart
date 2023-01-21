//Clear Goals Page
//Allows user to view their 3 goals
//Allows user to clear one or more goals
//Upon submission, send user to (Wait for 9PM Page) or Social Page if past 9

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:slide_to_act/slide_to_act.dart';
import '../auth.dart';
import 'package:check_it/database.dart';
import 'package:check_it/pages/SocialPage.dart';


class clearGoalsPage extends StatefulWidget {
  const clearGoalsPage({Key? key}) : super(key: key);

  @override
  State<clearGoalsPage> createState() => _clearGoals();
}

class _clearGoals extends State<clearGoalsPage> {
  String goalOne = "Goal one";
  String goalTwo = "Goal two";
  String goalThree = "Goal three";
  List<bool> checked = [false, false, false];

  String errorMessage = '';

  Future<List<String>> getGoals() async {
    return await RealtimeDatabase.readCurrentUserGoals(userId: Auth().getCurrentUserId()) ?? [];
  }

  Widget _goalView(String _goal) {
    return Row(
      children: [
        Expanded(
          child: Text(_goal, textScaleFactor: 1.5),
        ),
        Checkbox(
          checkColor: Theme.of(context).colorScheme.background,
          fillColor: MaterialStateProperty.resolveWith(getColor),
          value: checked[0],
          onChanged: (bool? value) {
            setState(() {
              checked[0] = value!;
            });
          },
        )
      ],
    );
  }

  Widget _title() {
    return Text(
        'CheckIt!',
        style: TextStyle(
            color: Theme.of(context).colorScheme.primary
        )
    );
  }

  Widget _entryField(
      String title,
      TextEditingController controller,
      ) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: title,
      ),
    );
  }

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.blue;
    }
    return Theme.of(context).colorScheme.primary;
  }


/*
  Widget _submitButton() {
    return ElevatedButton(
      onPressed: () {},
      child: const Text('Enabled'),
    );
  }

 */

  @override
  Widget build(BuildContext context) {
    bool isFinished = false;


    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        title: _title(),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FutureBuilder<List<String>> (
                future: getGoals(),
                builder: (context, snapshot) {
                  if (snapshot.hasData &&
                  snapshot.connectionState == ConnectionState.done) {
                  return Column(
                    children: List.generate(
                    snapshot.data!.length,
                    (index) => _goalView(snapshot.data?[index] ?? "got null"),
                    ),
                  );
                } else {
                  return Text('No Goals');
                }
              }
            ),
            ],
          ),
        ),
      );
  }
}
