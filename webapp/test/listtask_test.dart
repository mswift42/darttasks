library listtask_test;

import 'package:webapp/list_tasks.dart';
import 'package:unittest/unittest.dart';

main() {
  test('sortTasks', ()  {
    var l1 = [{"summary" : "a" ,"scheduled":"31/12/2013"},
      {"summary" : "b" ,"scheduled":"30/12/2013"}];
    var l2 = [{"summary": "a", "scheduled" :"10/12/2013"},
      {"summary": "b","scheduled": "09/12/2013"}];
    var l3 = [{"summary" : "a", "scheduled" :"01/01/2000"},
      {"summary" : "b", "scheduled": "02/01/2000"}];
    sortTasks(l1);
    expect(l1[0]['summary'],equals("b"));
    sortTasks(l2);
    expect(l2[0]['summary'],equals("b"));
    sortTasks(l3);
    expect(l3[0]['summary'],equals('a'));
  });
}