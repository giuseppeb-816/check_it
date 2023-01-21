import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:slide_to_act/slide_to_act.dart';
import '../auth.dart';
import 'package:check_it/database.dart';
import 'package:check_it/pages/SocialPage.dart';


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

  void writeGoals() async {
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
  }

  Widget _title() {
    return Text(
        'Set Your Goals!',
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
      appBar: AppBar(
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
              borderRadius: 25,
              outerColor: Theme.of(context).colorScheme.primary,
              text: "Swipe to submit goals!",
              textStyle: TextStyle(fontSize: 17, color: Colors.white),
              onSubmit: () {
                writeGoals();
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => SocialPageWidget()));
              },
            )
          ],
        ),
      ),
    );
  }
}
