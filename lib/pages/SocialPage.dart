//Page where user can view their total score and goal history
import 'package:check_it/pages/ProfilePage.dart';
import 'package:check_it/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:check_it/pages/SetGoalsPage.dart';
import 'package:check_it/database.dart';

class SocialPageWidget extends StatefulWidget {
  const SocialPageWidget({super.key});

  @override
  State<SocialPageWidget> createState() => _SocialPageWidgetState();
}

class _SocialPageWidgetState extends State<SocialPageWidget> {
  List<int> top = <int>[];
  List<int> bottom = <int>[];

  List<List<String>> goals = [
    ["Chris", "Run a mile", "true", "Eat sushi", "false", "Take a nap", "true"],
    ["Joey", "Go fishing", "true", "Eat a pie", "true", "Finish math homework", "true"],
    ["Anish", "Solve a competitive programming problem", "true", "Finish math homework", "false", "Learn a new programming language", "true"],
    ["Karthik", "Go to the gym", "true", "Finish Arduino project", "true", "Apply for an internship", "false"],
    ["Alice", "Send data to Bob", "true", "Learn about cryptography", "false", "Find her private key", "false"],
    ["Bob", "Receive data from Alice", "true", "Learn about cryptography", "true", "Find his public key", "false"],
  ];

  Future<List<List<dynamic>>> getGoals() async {
    return await RealtimeDatabase.readAllGoals() ?? [];
  }

  Widget getSocialPage(String name, List<String> goals, List<bool> isCompleted, BuildContext context, int index) {
    var theme = Theme.of(context);

    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        children: <Widget> [
          ListTile(
            leading: Icon(
              Icons.account_circle,
              size: 32,
              color: Colors.black,
            ),
            trailing: Icon(
              (isCompleted[0] == true && isCompleted[1] == true && isCompleted[2] == true) ?
              Icons.star_outlined : (isCompleted[0] == true || isCompleted[1] == true || isCompleted[2] == true) ?
              Icons.star_half_outlined : Icons.star_outline,
              size: 32,
              color: theme.colorScheme.tertiary,
            ),
            tileColor: index % 2 == 0 ? theme.colorScheme.inversePrimary : theme.colorScheme.background,
            title: Text('${name}'),
            subtitle: Text(
                "${isCompleted[0] == true ? "✔ " : "✘  "} ${goals[0]}\n"
                    + "${isCompleted[1] == true ? "✔ " : "✘  "} ${goals[1]}\n"
                    + "${isCompleted[2] == true ? "✔ " : "✘  "} ${goals[2]}"
            ),
            isThreeLine: true,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const Key centerKey = ValueKey<String>('bottom-sliver-list');
    var theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.primaryContainer,
      appBar: AppBar(
        title: const Text('Social Page'),
        backgroundColor: Colors.deepPurpleAccent[100],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_sharp),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding (
        padding: EdgeInsets.only(top: 15),
        child: FutureBuilder<List<List<dynamic>>>(
          future: getGoals(),
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.connectionState == ConnectionState.done) {
              return Padding (
              padding: EdgeInsets.all(0),
              child: ListView.builder(
                itemCount: snapshot.data?[0].length ?? 0,
                itemBuilder: (BuildContext context, int index) {
                  return getSocialPage(snapshot.data?[0][index], snapshot.data?[1][index][0], snapshot.data?[1][index][1], context, index);
                  }
                ),
              );
            } else {
              return Text('No profiles found.');
            }
          }
        ),
      ),
      bottomNavigationBar: new Container(
        padding: EdgeInsets.only(bottom: 12),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: ElevatedButton.icon(
                  onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage()));
                  },
                  icon: const Icon(Icons.home_filled),
                  label: Text("Home"),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: ElevatedButton.icon(
                  onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProfilePage()));
                  },
                  icon: const Icon(Icons.account_circle),
                  label: Text("Profile"),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: ElevatedButton.icon(
                  onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => setGoalsPage()));
                  },
                  icon: const Icon(Icons.check_box),
                  label: Text("Goals"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}