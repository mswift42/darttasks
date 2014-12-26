library new_task;

import 'dart:html';

initNewTask() {
    var newTaskButton = querySelector('#showNewTask');
    newTaskButton.onClick.listen(showNewTask);
    InputElement dateinp = querySelector('#dateinp');

    var cal = querySelector('.calendar');
    DateTime today = new DateTime.now();
    String todaystring = today.toString();
    dateinp.value = formatDate(todaystring);
    dateinp.onClick.listen(showCalendar);
    cal.setAttribute('data-date', formatDate(todaystring));

}
String formatDate(String date) {
    var spl = date.split('-');
    var day = spl[2].split(' ')[0];
    
    return day+"/" +spl[1] +"/" + spl[0];
}
void showCalendar(_) {
  var calview = querySelector('#calview');
  if (calview.style.display == 'none') {
    calview.style.display = '';
    
  } else {
    calview.style.display = 'none';
  }
}

void showNewTask(_) {
    var newTaskHtml = querySelector('#newTask');
    if (newTaskHtml.style.display == 'none') {
        newTaskHtml.style.display = '';
    } else {
        newTaskHtml.style.display = 'none';
    }
}
