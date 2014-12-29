library list_tasks;

import 'dart:html';
import 'dart:convert';


final String STORAGE_KEY = 'darttasks';

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
    
    
  }
  

}

// sortTasks - sort taskobjects by 'scheduled' in increasing order.
void sortTasks(List tasks) {
  tasks.sort((a,b) => a['scheduled'].compareTo(b['scheduled']));
}




