//Page where user can view their total score and goal history
import 'package:flutter/material.dart';
import 'package:check_it/pages/SetGoalsPage.dart';
void main() => runApp(const MyAppSocial());

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
    ["Anish", "Finish testing code", "false", "Play Clash Royale", "false", "Go home", "false"],
    ["Karthik", "Get flutter to work on Mac", "true", "Win a 5-leg parlay", "false", "Watch NBA games", "false"]
  ];

  @override
  Widget build(BuildContext context) {
    const Key centerKey = ValueKey<String>('bottom-sliver-list');
    var theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Social Page'),
        backgroundColor: theme.colorScheme.primary,
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
                  tileColor: index % 2 == 0 ? theme.colorScheme.inversePrimary : theme.colorScheme.primaryContainer,
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
      persistentFooterButtons: [
        ElevatedButton(onPressed: ()
        {

        }, child: Text("Settings")),
        ElevatedButton(onPressed: ()
        {

        }, child: Text("Profile")),
        ElevatedButton(onPressed: ()
        {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => setGoalsPage()));
        }, child: Text("Set Goals")),
      ],
    );
  }
}