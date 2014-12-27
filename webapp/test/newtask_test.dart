library newtask_test;

import 'package:webapp/new_task.dart';
import 'package:unittest/unittest.dart';

main() {
    test("formatDate", () {
    var t1 = new DateTime(2014,11,12);
    var t1string = t1.toString();
    var t2 = new DateTime(2014,11,5).toString();
    var t3 = new DateTime(2014,12,31).toString();
    expect(formatDate(t1string),equals("12/11/2014"));
    expect(formatDate(t2),equals("05/11/2014"));
    expect(formatDate(t3),equals("31/12/2014"));
    });
}
