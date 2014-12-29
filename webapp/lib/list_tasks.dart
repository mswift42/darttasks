library list_tasks;

import 'dart:html';
import 'dart:convert';


final String STORAGE_KEY = 'darttasks';
UListElement taskList;

void listTasks() {
  var tl = querySelector('#taskList');
  List tasks = JSON.decode(window.localStorage[STORAGE_KEY]);
  print(tasks);

}




