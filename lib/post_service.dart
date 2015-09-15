// Copyright (c) 2015, <Christian Loosli>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.
import 'dart:html';
import 'dart:convert';
import 'package:polymer/polymer.dart';

@CustomTag('post-service')
class PostService extends PolymerElement {
  //@observable List posts = [];
  @published List posts = toObservable([]);

  /// Constructor used to create instance of MainApp.
  PostService.created() : super.created() {
    HttpRequest.getString("api/posts.json").then((String json) {
      this.posts = toObservable(JSON.decode(json));
    }).catchError((Error error) {
      print(error.toString());
    });
  }

  void postsLoaded(var e, var detail, var node) {
    // Make a copy of the loaded data
    print('postsLoaded');
    //posts = this.$.ajax.response.slice(0);
    posts = detail['response'];
  }

  void setFavorite(uid, isFavorite) {
    // no service backend, just log the change
    print('Favorite changed: ' + uid + ", now: " + isFavorite);
  }

  ready() {
    super.ready();
    //posts.add(JSON.decode('{"uid": 1,"text":"Have you heard about the Web Components revolution?","username":"Eric","avatar":"../images/avatar-01.svg","favorite":false}'));
  }
}
