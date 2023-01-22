import 'package:check_it/pages/SocialPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:check_it/auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:check_it/pages/SetGoalsPage.dart';
import 'package:flutter/material.dart';
import 'package:check_it/database.dart';
import 'package:auto_size_text/auto_size_text.dart';

import 'ClearGoalsPage.dart';
import 'ProfilePage.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {

  final _database = FirebaseDatabase.instance.ref();
  final _user = Auth().getCurrentUserId();

  @override
  void initState() {
    getUsername();
    super.initState();
  }

  Future<void> signOut() async {
    await Auth().signOut();

  }

  void signOutButton() {
    signOut();
    Navigator.of(context).popUntil((route) => route.isFirst);
  }

  Future<String> getUsername() async {
    return await RealtimeDatabase.readUser(userId: Auth().getCurrentUserId());
  }

  Widget _title() {
    return Row(
      children: [
        Text(
            "CheckIt"
        ),
        Spacer(),
        Text(
          "BoilerMake X\nSpecial Demo",
          style: TextStyle(
            fontSize: 14,
          )
        )
      ]
    );
  }

  Widget _signOutButton(BuildContext context) {
    return ElevatedButton(
      onPressed: signOutButton,
      child: Padding(
          padding: const EdgeInsets.all(10),
          child: AutoSizeText(
            "Sign Out",
            style: TextStyle(
              fontSize: 24,
            ),
            maxLines: 1,
          )
      ),
    );
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
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FutureBuilder<String> (
              future: getUsername(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
                  return AutoSizeText(
                      'Welcome,\n${snapshot.data}!' ?? 'Username',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 54,
                        color: theme.colorScheme.primary,
                      ),
                      maxLines: 2,
                  );
                } else {
                  return Text('');
                }
              }
            ),
            SizedBox(height: 200),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => SocialPageWidget()));
                    },
                    child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: AutoSizeText(
                          "CheckOut",
                          style: TextStyle(
                            fontSize: 24,
                          ),
                          maxLines: 1,
                        )
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 50),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => setGoalsPage()));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: AutoSizeText(
                          "Set Goals",
                          style: TextStyle(
                            fontSize: 24,
                          ),
                          maxLines: 1,
                        )
                      ),
                  ),
                ),
                SizedBox(width: 50),
                Expanded(
                  flex: 1,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => clearGoalsPage()));
                    },
                    child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: AutoSizeText(
                          "CheckIn",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 24,
                          ),
                          maxLines: 1,
                        )
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 50),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProfilePage()));
                      },
                    child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: AutoSizeText(
                          "Profile",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 24,
                          ),
                          maxLines: 1,
                        )
                    ),
                  ),
                ),
                SizedBox(width: 50),
                Expanded(
                  flex: 1,
                  child: _signOutButton(context),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
