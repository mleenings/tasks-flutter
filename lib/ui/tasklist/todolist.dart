import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasks_flutter/data/models/task.dart';
import 'package:tasks_flutter/data/models/todoList.dart';
import 'package:tasks_flutter/ui/tasklist/task.dart';
import 'package:tasks_flutter/ui/tasklist/tasks.dart';

class TodoListWidget extends StatefulWidget {
  const TodoListWidget({Key? key}) : super(key: key);

  @override
  State<TodoListWidget> createState() => _TodoListWidgetState();
}

class _TodoListWidgetState extends State<TodoListWidget>{
  final TextEditingController _controller = TextEditingController();
  final listKey = GlobalKey<_TodoListWidgetState>();
  List<TaskModel> tasks = [];
  late TodoListModel todoListModel = TodoListModel();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(padding: EdgeInsets.all(5.0)),
      Consumer<TodoListModel>(
        builder: (context, tasks, child) {
          return FractionallySizedBox(
              widthFactor: 0.9,
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.teal)),
                    labelText: 'new task'),
                onSubmitted: (newTask) {
                  var task = TaskModel(text: newTask);
                  setState(() {
                    this.tasks.add(task);
                    tasks.addTaks(task); // create new instance of task changeNotifier model
                  });
                  _controller.clear(); // clear the text input after adding taks
                  tasks.saveTasksToSharedPrefs();
                },
              )
          );
        },
      ),
      Padding(padding: EdgeInsets.all(5.0)),
      Expanded(child: Consumer<TodoListModel>(builder: (context, tasks, child) {
        tasks.tasks.removeWhere((t) => t.completed);
        return ListView(
          key: listKey,
          children: tasks.tasks.where((t) => !t.deleted).map((TaskModel task) {
            return ChangeNotifierProvider.value(
                value: task, child: TaskWidget());
          },
          ).toList(),
        );
      })),
      ElevatedButton(onPressed: () {
            setState(() {
              TodoListModel().removeAllFinishedTasks();
              this.tasks = TodoListModel().tasks;
            });
          },
          child: Text('Delete finished Tasks')),
      Padding(padding: EdgeInsets.all(10.0)),
    ]);
  }
}