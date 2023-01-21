import 'package:flutter/material.dart';

class LoginOrSignUpPage extends StatelessWidget {
  const LoginOrSignUpPage({super.key});

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
                "CheckIt",
                style: style,
              ),
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