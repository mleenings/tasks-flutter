import 'package:flutter/foundation.dart';

class TaskModel extends ChangeNotifier{
  final String text;
  bool completed;
  bool deleted = false;

  TaskModel({required this.text, this.completed = false});

  TaskModel.fromJson(Map<String, dynamic> json)
      : text = json['text'],
        completed = json['completed'],
        deleted = json['deleted'];

  Map<String, dynamic> toJson() => {'text': text, 'completed': completed, 'deleted': deleted};

  void toggle() {
    completed = !completed;
    notifyListeners();
  }
}