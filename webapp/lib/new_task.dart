library new_task;

import 'dart:html';
import 'dart:convert';
import 'package:webapp/list_tasks.dart';
import 'package:webapp/toggle_display.dart';

initNewTask() {
  var newTaskButton = querySelector('#showNewTask');
  newTaskButton.onClick.listen(showNewTask);
  InputElement dateinp = querySelector('#dateinp');


  // saveTaskButton.onClick.listen(saveTask);
  var submitButton = querySelector('#savetask');
  submitButton.onClick.listen(submitTask);
  var cal = querySelector('.calendar');
  DateTime today = new DateTime.now();
  String todaystring = today.toString();
  dateinp.value = formatDate(todaystring);
  dateinp.onClick.listen(showCalendar);
  cal.setAttribute('data-date', formatDate(todaystring));

}
String formatDate(String date) {
  List spl = date.split('-');
  String day = spl[2].split(' ')[0];

  return day + "/" + spl[1] + "/" + spl[0];
}

void showCalendar(_) {
  toggleDisplay('#calview');
}

void showNewTask(_) {
  toggleDisplay('#newTask');
}
void toggleValidWarning() {
  toggleDisplay('#validationwarning');
}

void saveTask(_) {
  String sum = querySelector('#tsummary').value.trim();
  String con = querySelector('#tcontent').value;
  String sched = querySelector('#dateinp').value;
  String timestamp = new DateTime.now().millisecondsSinceEpoch.toString();
  if (validateTask(sum)) {
    var task = {
      "summary": sum,
      "content": con,
      "scheduled": sched,
      "id": timestamp
    };
    tasks.add(task);
    window.localStorage[STORAGE_KEY] = JSON.encode(tasks);

  } else {
    toggleValidWarning();

  }
}

void submitTask(Event e) {
  e.preventDefault();
  print(window.localStorage[STORAGE_KEY]);
  String sum = querySelector('#tsummary').value.trim();
  String con = querySelector('#tcontent').value;
  String sched = querySelector('#dateinp').value;

  String timestamp = new DateTime.now().millisecondsSinceEpoch.toString();
  print(validateTask(sum));
  print(sum.length);
  if (validateTask(sum)) {
    var task = {
      'summary': sum,
      'content': con,
      'scheduled': sched,
      'id': timestamp
    };
    tasks.add(task);
    window.localStorage[STORAGE_KEY] = JSON.encode(tasks);
        toggleDisplay('#newTask');
        removeAllTasks();
        listTasks();

  } else {
    toggleValidWarning();
  }
}

bool validateTask(String sumstring) {
  return sumstring != '';
}
