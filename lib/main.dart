import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:tasks_flutter/ui/tasklist/tasks.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task list',
      home: Scaffold(
        appBar: AppBar(
          title: Text("Todo-list"),
        ),
        body: Tasks(),
      ),
    );
  }
}
