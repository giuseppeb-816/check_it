// Page where users can view their profile
import 'package:flutter/material.dart';
import 'package:check_it/database.dart';
import 'package:check_it/auth.dart';

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
            color: Colors.black,
        )
    );
  }

  Future<String> getUsername() async {
    return await RealtimeDatabase.readUser(userId: Auth().getCurrentUserId());
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent[100],
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                  FutureBuilder<String> (
                      future: getUsername(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
                          return Text(
                              snapshot.data! ?? 'Username',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 50,
                                color: theme.colorScheme.primary,
                              )
                          );
                        } else {
                          return Text('');
                        }
                      }
                  ),
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
                        "379",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 56,
                            color: theme.colorScheme.primary,
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(
                        "CheckIt\nScore",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 18,
                            color: theme.colorScheme.secondary,
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
                            color: theme.colorScheme.primary,
                        ),
                      ),
                      Text(
                        "Goals Completed",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          fontStyle: FontStyle.italic,
                          color: theme.colorScheme.secondary,
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
                              fontSize: 44,
                              color: theme.colorScheme.primary,
                          ),
                        ),
                        Text(
                          "Friends",
                          style: TextStyle(
                            fontSize: 18,
                            fontStyle: FontStyle.italic,
                            color: theme.colorScheme.secondary,
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