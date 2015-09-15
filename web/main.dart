import 'dart:html';
import 'package:polymer/polymer.dart';
import 'package:paper_elements/paper_tabs.dart';

main() {
  initPolymer();

  Polymer.onReady.then((_) {
    var tabs = querySelector('paper-tabs') as PaperTabs;
    var list = querySelector('post-list');
    tabs.addEventListener('core-select', (_) {
      list.show = tabs.selected;
    });
  });
}
