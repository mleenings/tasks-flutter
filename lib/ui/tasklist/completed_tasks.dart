import 'package:flutter/material.dart';
import 'package:tasks_flutter/data/models/todoList.dart';

class CompletedTasks extends StatelessWidget {
  final TodoListModel taskList;

  CompletedTasks({required this.taskList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Completed Items'),
        ),
        body: ListView(
            children: taskList.getCompletedTasks().map((t) {
              return Container(
                  height: 50,
                  child: Center(child: Text(t.text, style: TextStyle(fontSize: 20))));
            }).toList()));
  }
}
