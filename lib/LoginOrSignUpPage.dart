import 'package:flutter/material.dart';

class LoginOrSignUp extends StatelessWidget {
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("CheckIt"),
              const SizedBox(height: 100),
              ElevatedButton(
                onPressed: () {

                },
                child: Text('Login'),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {

                },
                child: Text('Sign Up'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}