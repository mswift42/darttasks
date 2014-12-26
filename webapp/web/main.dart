// Copyright (c) 2014, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:html';

import 'package:webapp/nav_menu.dart';
import 'package:route_hierarchical/client.dart';
import 'package:bootjack_datepicker/bootjack_datepicker.dart';

ButtonElement newTaskButton;

void main() {
  initNavMenu();
  newTaskButton = querySelector('#showNewTask');
  newTaskButton.onClick.listen(showNewTask);

  // Webapps need routing to listen for changes to the URL.
  var router = new Router();
  router.root
    ..addRoute(name: 'about', path: '/about', enter: showAbout)
    ..addRoute(name: 'home', defaultRoute: true, path: '/', enter: showHome);
  router.listen();

  Calendar.use(); // Init Bootjack_Datepicker
  InputElement dateinp = querySelector('#dateinp');
  var cal = querySelector('.calendar');
  DateTime today = new DateTime.now();
  String todaystring = today.toString();
  dateinp.value = formatDate(todaystring);
  dateinp.onClick.listen(showCalendar);
  cal.setAttribute('data-date',formatDate(todaystring));
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

void showAbout(RouteEvent e) {
  // Extremely simple and non-scalable way to show different views.
  querySelector('#home').style.display = 'none';
  querySelector('#about').style.display = '';
}

void showHome(RouteEvent e) {
  querySelector('#home').style.display = '';
  querySelector('#about').style.display = 'none';
}
String formatDate(String date) {
    var spl = date.split('-');
    var day = spl[2].split(' ')[0];
    
    return day+"/" +spl[1] +"/" + spl[0];
}
