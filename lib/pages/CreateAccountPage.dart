//Create Accounts Page
//Allows user to enter a new username and password
//Validates with database
//Does not submit if invalid data
//Alerts user if data is invalid
//Sends user to main application if valid new account

import 'package:flutter/material.dart';

class CreateAccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
    );

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Create Account",
                style: style,
              ),
              const SizedBox(height: 100),
              Row(
                children: [
                  Text(
                    "Username",
                    style: style
                  ),
                  const TextField(),
                ]
              ),
              const SizedBox(height: 10),
              Row(
                  children: [
                    Text(
                        "Password",
                        style: TextStyle(
                          color: theme.colorScheme.onPrimary,
                        )
                    ),
                    const Text("a"),
                  ]
              ),
              ElevatedButton(
                onPressed: () {

                },
                child: const Text('Create'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}