library new_task;

import 'dart:html';
import 'dart:convert';

initNewTask() {
    var newTaskButton = querySelector('#showNewTask');
    newTaskButton.onClick.listen(showNewTask);
    InputElement dateinp = querySelector('#dateinp');
    var saveTaskButton = querySelector('#savetask');
    saveTaskButton.onClick.listen(saveTask);

    var cal = querySelector('.calendar');
    DateTime today = new DateTime.now();
    print(today.millisecondsSinceEpoch);
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
void saveTask(_) {
    String sum = querySelector('#tsummary').value;
    String con = querySelector('#tcontent').value;
    String sched = querySelector('#dateinp').value;
    String timestamp = new DateTime.now().millisecondsSinceEpoch.toString();
    final String STORAGE_KEY = 'darttasks';
    List tasks = [];
    if(window.localStorage.containsKey(STORAGE_KEY)) {
        tasks = JSON.decode(window.localStorage[STORAGE_KEY]);

        // Decoding Error, should not happen
        if(tasks == null) {
            tasks = [];
        }
    }

    var task = {
        "summary": sum,
        "content": con,
        "scheduled": sched,
        "id": timestamp
    };
    tasks.add(task);
    window.localStorage[STORAGE_KEY] = JSON.encode(tasks);
}
