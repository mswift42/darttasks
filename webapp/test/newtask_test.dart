library newtask_test;

import 'package:webapp/new_task.dart';
import 'package:unittest/unittest.dart';
import 'dart:html';

main() {
    test("formatDate", () {
    var t1 = new DateTime(2014,11,12);
    var t1string = t1.toString();
    var t2 = new DateTime(2014,11,5).toString();
    var t3 = new DateTime(2014,12,31).toString();
    var t4 = new DateTime(2011,1,1).toString();
    expect(formatDate(t1string),equals("12/11/2014"));
    expect(formatDate(t2),equals("05/11/2014"));
    expect(formatDate(t3),equals("31/12/2014"));
    expect(formatDate(t4),equals("01/01/2011"));
    });
    test("showNewTask",() {
        var newt = querySelector('#newTask');
        expect(newt.style.display, equals('none'));
        showNewTask('');
        expect(newt.style.display, equals(''));
        showNewTask('');
        expect(newt.style.display,equals('none'));

    });
    test("showCalendar",() {
    var cal = querySelector("#calview");
    expect(cal.style.display, equals('none'));
    showCalendar('');
    expect(cal.style.display, equals(''));
    showCalendar('');
    expect(cal.style.display,equals('none'));

    });
      test('validateTask',() {
    expect(validateTask(""),equals(false));
    expect(validateTask("someinput"),equals(true));
  });

}
