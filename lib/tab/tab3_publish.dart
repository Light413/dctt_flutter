////////////////////////////////////////////////////////////////////////////////
// tab3_publish.dart
// dctt_flutter
// lastModified 7/29/20 1:32 PM
// Created by Light413. on 2020-07-29 13:34:51
// Copyright ©2020 Light413. All rights reserved.
////////////////////////////////////////////////////////////////////////////////
import 'package:dcttflutter/common/custom_appbar.dart';
import 'package:flutter/material.dart';

class Publish extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(needLeading: false,title: Text('发布', style:TextStyle(fontSize: 18))),

      body: Container(
        child: Text(''),
      ),

      backgroundColor: Colors.yellow[100],
    );
  }
}
