//Page where user can view their total score and goal history
import 'package:check_it/pages/ProfilePage.dart';
import 'package:check_it/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:check_it/pages/SetGoalsPage.dart';
void main() => runApp(const MyAppSocial());


//return container with everything
//name, second list of goals (within list of goals s
//func1(name, list of goals, list of completed booleans) -> tied indexes, return Padding widget
Widget getSocialPage(String name, List<String> goals, List<bool> isCompleted) {
  return Padding(
    padding: EdgeInsets.all(0),
    child: Column(
      children: <Widget> [
        ListTile(
          leading: Icon(
            Icons.account_circle,
            size: 32,
            color: Colors.tealAccent,
          ),
          trailing: Icon(
            (goals[0] == "true" && goals[1] == "true" && goals[2] == "true") ?
            Icons.star_outlined : (goals[0] == "true" || goals[1] == "true" || goals[2] == "true") ?
            Icons.star_half_outlined : Icons.star_outline,
            size: 32,
            color: Colors.tealAccent,
          ),
          tileColor: 0 % 2 == 0 ? Colors.tealAccent : Colors.tealAccent,
          title: Text('${isCompleted[0]}'),
          subtitle: Text(
              "${isCompleted[0] == "true" ? "✔ " : "✘  "} ${isCompleted[0]}\n"
                  + "${isCompleted[1] == "true" ? "✔ " : "✘  "} ${isCompleted[1]}\n"
                  + "${isCompleted[2] == "true" ? "✔ " : "✘  "} ${isCompleted[2]}"
          ),
          isThreeLine: true,
        ),
      ],
    ),
  );
}


class MyAppSocial extends StatelessWidget {
  const MyAppSocial({super.key});

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)
      ),
      home: SocialPageWidget(),
    );
  }
}

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
        padding: EdgeInsets.all(0),
        child: ListView.builder(
            itemCount: goals.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding (
                padding: EdgeInsets.all(10),
                child: ListTile(
                  leading: Icon(
                      Icons.account_circle,
                    size: 32,
                    color: theme.colorScheme.tertiary
                  ),
                  trailing: Icon(
                      (goals[index][2] == "true" && goals[index][4] == "true" && goals[index][6] == "true") ?
                      Icons.star_outlined : (goals[index][2] == "true" || goals[index][4] == "true" || goals[index][6] == "true") ?
                      Icons.star_half_outlined : Icons.star_outline,
                    size: 32,
                    color: theme.colorScheme.tertiary

                  ),
                  tileColor: index % 2 == 0 ? theme.colorScheme.inversePrimary : theme.colorScheme.background,
                  title: Text('${goals[index][0]}'),
                  subtitle: Text(
                      "${goals[index][2] == "true" ? "✔ " : "✘  "} ${goals[index][1]}\n"
                          + "${goals[index][4] == "true" ? "✔ " : "✘  "} ${goals[index][3]}\n"
                          + "${goals[index][6] == "true" ? "✔ " : "✘  "} ${goals[index][5]}"
                  ),
                  isThreeLine: true,
                ),
              );
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