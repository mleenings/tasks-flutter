import 'dart:convert';

import 'package:http/http.dart';
import 'package:tasks_flutter/data/models/task.dart';

const String baseURL = 'http://localhost:8080';
const String apiURL = '/api/tasks/';
const String taskURL = baseURL + apiURL;

class TaskService {

  Future getData(String url) async {
    print('Calling uri: GET $url');
    final response = await get(Uri.parse(url));
    if(response.statusCode == 200){
      return response.body;
    } else {
      print(response.statusCode);
    }
  }

  Future putData(String url, List<TaskModel> tasks) async {
    print('Calling uri: PUT $url');
    final response = await put(Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: json.encoder.convert(tasks));
    if(response.statusCode == 200){
      return response.body;
    } else {
      print(response.statusCode);
    }
  }

  Future<dynamic> getTasks() async {
    final tasksData = await getData(taskURL);
    return tasksData;
  }

  Future<dynamic> updateOrAddTasks(List<TaskModel> tasks) async {
    final tasksData = await putData(taskURL, tasks);
    return tasksData;
  }

  Future<dynamic> updateOrAddTask(TaskModel task) async {
    final tasksData = await putData(taskURL, [task]);
    return tasksData;
  }
}