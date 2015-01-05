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
    var l4 = [{"summary" : "a", "scheduled" :"01/01/2000"},
      {"summary" :"b","scheduled" : "31/12/1999"}];
    var l5 = [{"summary" :"a", "scheduled" :"29/02/2012"},
      {"summary" :"b", "scheduled": "01/03/2012"}];
    sortTasks(l1);
    expect(l1[0]['summary'],equals("b"));
    sortTasks(l2);
    expect(l2[0]['summary'],equals("b"));
    sortTasks(l3);
    expect(l3[0]['summary'],equals('a'));
    sortTasks(l4);
    expect(l4[0]['summary'],equals('b'));
    sortTasks(l5);
    expect(l5[0]['summary'],equals('a'));
  });
  test('parseTimeString', () {
  var  t1 = parseTimeString("01/01/2000");
  var  t2 = parseTimeString("31/12/2010");
  var  t3 = parseTimeString("30/06/2014");
  var  t4 = parseTimeString("05/01/2014");
    expect(t1.year,equals(2000));
    expect(t1.day,equals(1));
    expect(t2.month,equals(12));
    expect(t2.year,equals(2010));
    expect(t2.day,equals(31));
    expect(t3.day,equals(30));
    expect(t3.month,equals(6));
    expect(t3.year,equals(2014));
    expect(t4.year,equals(2014));
    expect(t4.month,equals(1));
    expect(t4.day,equals(5));
  });
    }