import 'package:dcttflutter/common/date_formatter.dart';
import 'package:dcttflutter/common/style.dart';
import 'package:dcttflutter/common/user.dart';
import 'package:flutter/cupertino.dart';

////////////////////////////////////////////////////////////////////////////////
// list_item_bottom.dart
// dctt_flutter
// lastModified 2020-08-06
// Created by Light413. on 2020-08-06
// Copyright ©2020 Light413. All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//列表底部内容(用户名，阅读量、时间等内容)
class ListItemBottom extends StatelessWidget {
  ListItemBottom(this.obj);
  final Map obj;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 12,bottom: 0),
      child:  Row(
        children: <Widget>[
          Expanded(child: Row(
            children: <Widget>[
              Text('${getUserName(obj['user'])}' , style: ttListBottomTextStyle),

              Container(
                margin: EdgeInsets.only(left: 20),
                child: Text('阅读 ${obj['readCnt']}' , style: ttListBottomTextStyle),
              ),
            ],
          )),

          Container(
            margin: EdgeInsets.only(left: 15,right: 10),
            child: Text(TTDateFormatter.formatter(obj['postDate']) , style: ttListBottomTextStyle),
          ),

        ],
      ),
    );
  }
}
