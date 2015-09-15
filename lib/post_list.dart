// Copyright (c) 2015, <Christian Loosli>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:html';

import 'package:polymer/polymer.dart';

@CustomTag('post-list')
class PostList extends PolymerElement {
  @observable List posts = toObservable([]);
  @published String show = '';

  PostList.created() : super.created();

  void handleFavorite(Event event, Object object, PolymerElement sender) {
    var post = sender.templateInstance.model.post;
    //    service.setFavorite(post.uid, post.favorite);
    this.$['service'].setFavorite(post['uid'], post['favorite']);
  }
}
