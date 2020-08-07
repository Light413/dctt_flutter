import 'package:flutter/material.dart';

////////////////////////////////////////////////////////////////////////////////
// home_listitem_3image.dart
// dctt_flutter
// lastModified 2020-08-06
// Created by Light413. on 2020-08-06
// Copyright ©2020 Light413. All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//显示3个图
class HomeListItemImages extends StatelessWidget {
  HomeListItemImages(this.arr);
  
  final List arr;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    print('HomeListItemImages---width is $width; height is $height');
    double _screenWidth = width * 0.3;
    
    return Container(
      margin: EdgeInsets.only(top: 5,bottom: 2),
      child: Flex(
        direction: Axis.horizontal,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.only(right: 2),
              child: Image.network(arr[0] , height: _screenWidth,fit: BoxFit.cover,),
            ),
          ),

          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.only(right: 2),
              child: Image.network(arr[1] , height: _screenWidth,fit: BoxFit.cover,),
            ),
          ),

          Expanded(
            flex: 1,
            child: Container(
//            padding: EdgeInsets.only(left: ,right: 5),
              child: Image.network(arr[2] , height: _screenWidth,fit: BoxFit.cover,),
            ),
          ),

        ],
      ) ,
    );;
  }
}
