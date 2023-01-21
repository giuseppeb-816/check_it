import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../auth.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';

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
          ],
            /*
            SwipeableButtonView (
              buttonText: "Swipe to Confirm Goals!",
              buttonWidget: Container(
                child: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.grey,
                )
              ),
            )
            */
        ),
      ),
    );
  }
}
