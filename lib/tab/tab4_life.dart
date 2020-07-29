////////////////////////////////////////////////////////////////////////////////
// tab4_life.dart
// dctt_flutter
// lastModified 7/29/20 1:32 PM
// Created by Light413. on 2020-07-29 13:35:36
// Copyright ©2020 Light413. All rights reserved.
////////////////////////////////////////////////////////////////////////////////
import 'package:dcttflutter/common/custom_appbar.dart';
import 'package:flutter/material.dart';

class Life extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(needLeading: false,title: Text('生活', style:TextStyle(fontSize: 18))),

      body: Container(
        child: Text(''),
      ),

      backgroundColor: Colors.orange[100],
    );
  }
}
