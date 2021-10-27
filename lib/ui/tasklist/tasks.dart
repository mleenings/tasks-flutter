import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:tasks_flutter/data/models/todoList.dart';
import 'package:tasks_flutter/ui/tasklist/todolist.dart';

import 'completed_tasks.dart';

class Tasks extends StatelessWidget {
  // display completed tasks screen
  void _goToCompletedTasks(context, taskList) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => CompletedTasks(taskList: taskList)));
  }

  @override
  Widget build(BuildContext context) {
    // get tasks from shared preferences
    final TodoListModel todoList = TodoListModel();
    // getTasksFromSharedPrefs call notifyListeners
    todoList.getTasksFromSharedPrefs();

    return Scaffold(
        /*appBar: AppBar(
          title: Text('TodoList'),
          actions: [
            Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: IconButton(
                    icon: Icon(Icons.check),
                    onPressed: () => _goToCompletedTasks(context, todoList)))
          ],
        ),*/
        body: ChangeNotifierProvider.value(
          value: todoList,
          child: TodoListWidget(),
        ));
  }
}