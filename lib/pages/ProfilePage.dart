// Page where users can view their profile
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePage();
}

class _ProfilePage extends State<ProfilePage> {
  Widget _title() {
    return Text(
        'Profile',
        style: TextStyle(
            color: Theme.of(context).colorScheme.primary
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        title: _title(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(0),
              child: Row(
                  children: <Widget>[
                    Text(
                      "Profile Name",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 60,
                      ),
                    )
                  ]
              ),
            ),
            SizedBox(height: 40),
            Row(
              children: <Widget>[
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "21420",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 56
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(
                        "Check\nScore",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "21",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 44,
                        ),
                      ),
                      Text(
                        "Goals Completed",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          fontStyle: FontStyle.italic,
                        )
                      )
                    ],
                  )
                ),
                SizedBox(width: 20),
                Expanded(
                    child: Column(
                      children: [
                        Text(
                          "43",
                          style: TextStyle(
                              fontSize: 44
                          ),
                        ),
                        Text(
                          "Friends",
                          style: TextStyle(
                            fontSize: 18,
                            fontStyle: FontStyle.italic,
                          )
                        )
                      ],
                    )
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}