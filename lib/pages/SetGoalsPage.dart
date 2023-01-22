import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:slide_to_act/slide_to_act.dart';
import '../auth.dart';
import 'package:check_it/database.dart';
import 'package:check_it/pages/SocialPage.dart';
import 'package:check_it/pages/ClearGoalsPage.dart';


class setGoalsPage extends StatefulWidget {
  const setGoalsPage({Key? key}) : super(key: key);

  @override
  State<setGoalsPage> createState() => _createGoals();
}

class _createGoals extends State<setGoalsPage> {
  String? errorMessage = '';

  final TextEditingController _goalOne = TextEditingController();
  final TextEditingController _goalTwo = TextEditingController();
  final TextEditingController _goalThree = TextEditingController();

  Future<bool> writeGoals(BuildContext context) async {
    List<String> goalsIds = await RealtimeDatabase.readCurrentUserGoalIds(userId: Auth().getCurrentUserId()) ?? [];
    RealtimeDatabase.clearUserGoals(goalIds: goalsIds);
    RealtimeDatabase.writeGoal(
      data: {
        'name': _goalOne.text,
        'user_id': Auth().getCurrentUserId(),
        'done': false,
        'current': true,
      },
    );
    RealtimeDatabase.writeGoal(
      data: {
        'name': _goalTwo.text,
        'user_id': Auth().getCurrentUserId(),
        'done': false,
        'current': true,
      },
    );
    RealtimeDatabase.writeGoal(
      data: {
        'name': _goalThree.text,
        'user_id': Auth().getCurrentUserId(),
        'done': false,
        'current': true,
      },
    );
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => clearGoalsPage()));
    return true;
  }

  Widget _title() {
    return Text(
        'Set Your Goals!',
      style: TextStyle(
        color: Colors.black,
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
    final GlobalKey<SlideActionState> _key = GlobalKey();
    bool isFinished = false;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent[100],
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
            _entryField('Goal One', _goalOne),
            _entryField('Goal Two', _goalTwo),
            _entryField("Goal Three", _goalThree),
            Padding(padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 60)),
            SlideAction(
              key: _key,
              borderRadius: 25,
              outerColor: Colors.deepPurpleAccent[100],
              text: "Swipe to submit goals!",
              textStyle: TextStyle(fontSize: 17, color: Colors.white),
              onSubmit: () {
                if (!(_goalOne.text == "" || _goalTwo.text == "" || _goalThree.text == "" || _goalOne.text.length > 34 || _goalTwo.text.length > 34 || _goalThree.text.length > 34)) {
                  writeGoals(context);
                } else {
                  _key.currentState?.reset();
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
