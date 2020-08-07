////////////////////////////////////////////////////////////////////////////////
// user.dart
// dctt_flutter
// lastModified 2020-08-06
// Created by Light413. on 2020-08-06
// Copyright ©2020 Light413. All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//获取用户基础信息
String getUserName(Map obj) {
  return obj['name'] ?? obj['nickName'];
}

String getUserId(Map obj){
  return obj['user_id'];
}

String getUserAvatar(obj){
  return obj['avatar_thumb'];
}