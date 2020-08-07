import 'package:dcttflutter/common/string_formatter.dart';
import 'package:dcttflutter/common/style.dart';
import 'package:dcttflutter/component/home_listitem_3image.dart';
import 'package:flutter/material.dart';

import 'list_item_bottom.dart';

////////////////////////////////////////////////////////////////////////////////
// home_list_item.dart
// dctt_flutter
// lastModified 2020-08-06
// Created by Light413. on 2020-08-06
// Copyright ©2020 Light413. All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//不包含图片
class HomeListItem extends StatelessWidget {
  HomeListItem(this.obj);
  final Map obj;
  double _screenWidth;

  Widget content(){
    //动态内容
   return Text(deleteLine('${obj['content']}'),
      style: TextStyle(fontSize: 17, color: Color(0xff333333),height: 1.5),
      maxLines: 3,
      overflow: TextOverflow.ellipsis,);
  }

  Widget oneIg(arr){
    return Container(
      child:
          Flex(
            direction: Axis.horizontal,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(deleteLine('${obj['content']}'),
                      style: TextStyle(fontSize: 17, color: Color(0xff333333),height: 1.5),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,),

                    ListItemBottom(obj)
                  ],
                ) ,
              ),

              Expanded(
                flex: 1,
                child:  Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10.0))
                  ),
                  padding: EdgeInsets.only(left: 8),
                  child: Image.network(arr[0] , height: 90,fit: BoxFit.cover,),
                ),
              )
            ],
          ),

    );
  }


  //获取不同的list item
  List _getItemsWidget(){
    List<Widget> items = [];

    String imgStr = obj['images'];
    if(imgStr != null && imgStr.length > 10){
      List<String>igsArr = imgStr.split(",");
      if(igsArr.length < 2){
        Widget ig = oneIg(igsArr);
        items.add(ig);
//        items.add(ListItemBottom(obj));
        return items;
      }else
      if(igsArr.length > 2){
        //纯文字
        items.add(content());

        Widget ig = HomeListItemImages(igsArr);
        items.add(ig);
      }

    }else{
      //纯文字
      items.add(content());
    }

    items.add(ListItemBottom(obj));
    return items;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    double _screenWidth = width * 0.3;

    return Container(
      padding: ttPagePading,
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(0xfff0f0f0),width: 1)),
      ),
      child: Column(
        crossAxisAlignment:CrossAxisAlignment.start,

        children: _getItemsWidget(),
      ),
    );
  }
}
