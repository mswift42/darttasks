library list_tasks;

import 'dart:html';
import 'dart:convert';
import 'package:webapp/toggle_display.dart';


final String STORAGE_KEY = 'darttasks';
List tasks = [];


void tasksInit() {
  if (window.localStorage.containsKey(STORAGE_KEY)) {
    tasks = JSON.decode(window.localStorage[STORAGE_KEY]);

    // Decoding Error, should not happen
    if (tasks == null) {
      tasks = [];
    }
  } else {
    window.localStorage[STORAGE_KEY] = JSON.encode(tasks);
  }
}
void listTasks() {
  var tl = querySelector('#tasklist');
  List tasks = JSON.decode(window.localStorage[STORAGE_KEY]);
  sortTasks(tasks);
  for (var task in tasks) {
    var singletask = new LIElement();
    var tasksummarycontainer = new DivElement();
    var tasksummary = new Element.tag('p');
    var taskcontentcontainer = new DivElement();
       var taskcontent = new PreElement();
    tl.children.add(singletask);
    singletask.children.add(tasksummary);
    tasksummary.appendText(task['summary']);
    singletask.append(taskcontentcontainer);
    taskcontentcontainer.append(taskcontent);
    taskcontent.appendText(task['content']);

    taskcontentcontainer
        ..style.display = 'none'
         ..id = 'id' + task['id'];

    tasksummary.onClick.listen((e) => toggleContentView(task['id']));

  }
}

// sortTasks - sort taskobjects by 'scheduled' in increasing order.
void sortTasks(List tasks) {
  tasks.sort((a, b) => parseTimeString(a['scheduled']).compareTo(parseTimeString(b['scheduled'])));
}

void removeAllTasks() {
  var tl = querySelector('#tasklist');
  tl.children.clear();
}


// parseTimeString - convert a date in format dd/mm/yyyy to a DateTime
// object.
DateTime parseTimeString(String date) {
  var spl = date.split('/');
  return DateTime.parse(spl[2]+spl[1]+spl[0]);
}

void toggleContentView(id) {
  toggleDisplay("#id" + id);
}


