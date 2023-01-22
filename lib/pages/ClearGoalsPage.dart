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
  String errorMessage = '';

  Future<List<List<dynamic>>> getGoals() async {
    return await RealtimeDatabase.readCurrentUserGoals(userId: Auth().getCurrentUserId()) ?? [];
  }

  Widget _goalView(String _goal, bool _checked, String _id) {
    return Row(
      children: [
        Expanded(
          child: Text(_goal, textScaleFactor: 1.5),
        ),
        Checkbox(
          checkColor: Theme.of(context).colorScheme.background,
          fillColor: MaterialStateProperty.resolveWith(getColor),
          value: _checked,
          onChanged: (bool? value) {
            RealtimeDatabase.changeDoneStatus(goalId: _id, currentStatus: _checked);
            setState(() {
              _checked = !_checked;
            });
          },
        )
      ],
    );
  }

  Widget _title() {
    return Text(
        'CheckIt',
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
        child: StreamBuilder<List<List<dynamic>>> (
          stream: getGoals().asStream(),
          builder: (context, snapshot) {
            if (snapshot.hasData &&
              snapshot.connectionState == ConnectionState.done) {
              return Padding (
                padding: EdgeInsets.all(0),
                child: ListView.builder(
                  itemCount: snapshot.data?[0].length ?? 0,
                  itemBuilder: (BuildContext context, int index) {
                    return _goalView(snapshot.data?[0][index] ?? "got null", snapshot.data?[1][index] ?? false,
                    snapshot.data?[2][index] ?? "");
                  }
                ),
              );
            } else {
              return Text('');
            }
          }
        ),
      ),
    );
  }
}
