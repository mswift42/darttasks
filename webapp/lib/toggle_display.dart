library toggle_display;

import 'dart:html';

void toggleDisplay(String element) {
  var elem = querySelector(element);
  if (elem.style.display == 'none') {
    elem.style.display = '';
  } else {
    elem.style.display ='none';
  }
}