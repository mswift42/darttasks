// Copyright (c) 2014, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:html';

import 'package:webapp/nav_menu.dart';
import 'package:webapp/new_task.dart';
import 'package:webapp/list_tasks.dart';
import 'package:route_hierarchical/client.dart';
import 'package:bootjack_datepicker/bootjack_datepicker.dart';

ButtonElement newTaskButton;

void main() {
  initNavMenu();
  initNewTask();
  listTasks();

  // Webapps need routing to listen for changes to the URL.
  var router = new Router();
  router.root
    ..addRoute(name: 'about', path: '/about', enter: showAbout)
    ..addRoute(name: 'home', defaultRoute: true, path: '/', enter: showHome);
  router.listen();

  Calendar.use(); // Init Bootjack_Datepicker
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
