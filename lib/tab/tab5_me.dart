////////////////////////////////////////////////////////////////////////////////
// tab5_me.dart
// dctt_flutter
// lastModified 7/23/20 5:52 PM
// Created by Light413. on 2020-07-29 13:34:24
// Copyright ©2020 Light413. All rights reserved.
////////////////////////////////////////////////////////////////////////////////
import 'package:dcttflutter/common/custom_appbar.dart';
import 'package:flutter/material.dart';


class Me extends StatefulWidget {
  @override
  _MeState createState() => _MeState();
}

class _MeState extends State<Me> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(needLeading: false,title: Text('我的', style:TextStyle(fontSize: 18))),

      body: Container(
        child: Text(''),
      ),

      backgroundColor: Colors.orange,
    );
  }
}
