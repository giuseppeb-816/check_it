import 'package:check_it/pages/SocialPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:check_it/auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:check_it/pages/SetGoalsPage.dart';
import 'package:flutter/material.dart';
import 'package:check_it/database.dart';

import 'ClearGoalsPage.dart';

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

  Future<String> getUsername() async {
    return await RealtimeDatabase.readUser(userId: Auth().getCurrentUserId());
  }

  Widget _title() {
    return const Text('CheckIt');
  }

  Widget _signOutButton() {
    return ElevatedButton(
      onPressed: signOut,
      child: const Text('Sign Out'),
    );
  }

  @override
  Widget build(BuildContext context) {
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
                  return Text(snapshot.data ?? 'Username');
                } else {
                  return Text('Username');
                }
              }
            ),
            _signOutButton(),
            ElevatedButton(onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => setGoalsPage()));
            }, child: Text("Set Goals")),
            ElevatedButton(onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => clearGoalsPage()));
            }, child: Text("Check Goals")),
            ElevatedButton(onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => SocialPageWidget()));
            }, child: Text("Social Page")),
          ],
        ),
      ),
    );
  }
}
