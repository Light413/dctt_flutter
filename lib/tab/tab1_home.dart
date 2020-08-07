////////////////////////////////////////////////////////////////////////////////
// tab1_home.dart
// dctt_flutter
// lastModified 7/29/20 10:20 AM
// Created by Light413. on 2020-07-29 13:35:05
// Copyright ©2020 Light413. All rights reserved.
////////////////////////////////////////////////////////////////////////////////
import 'dart:convert';
import 'package:dcttflutter/common/api.dart';
import 'package:dcttflutter/common/custom_appbar.dart';
import 'package:dcttflutter/common/date_formatter.dart';
import 'package:dcttflutter/common/string_formatter.dart';
import 'package:dcttflutter/common/style.dart';
import 'package:dcttflutter/common/user.dart';
import 'package:dcttflutter/component/home_list_item.dart';
import 'package:dcttflutter/component/list_item_bottom.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  List dataArray = [];

  void loadData(){
    var pars = {
      "category":"sy" ,
      "subType":0,
      "pageNumber":1
    };

    apiPostRequest(get_sy_url ,option: pars,  successCallBack: (value){
      //  var body = value.data.transform(Utf8Decoder()).join();
      var data = value ;
      print(data[1]);

      setState(() {
        this.dataArray = data;
      });
    } , errorCallBack: (err){
      print("----errrrrr:" + err);
    });

  }


  //直接用HttpClient网络请求
  void get() async {
    var client = new HttpClient();
    var url = new Uri.http('dancheng0394.com', '/tt/' + sy_getSysMsg);
    //方式1
    //var request = await client.getUrl(url);
    //方式2,参数直接拼接到path？ get：Opens a HTTP connection using the GET method.
    var request = await client.get('39.106.164.101', 80, '/tt/' + sy_getSysMsg);

    //close：Close the request for input. Returns the value of [done]
    //返回服务器返回的数据流，关闭连接
    var response = await request.close();
    //获取响应返回的数据流
    var body = await response.transform(Utf8Decoder()).join();
    print('----:' + body);
    Map data = JsonDecoder().convert(body);
    print(data['msg']);
  }
  ///   @override
  void initState() {
    super.initState();

    loadData();
  }

  @override
  void dispose() {
    super.dispose();
  }

  //获取不同的list item
  Widget _getItemWidget(Map obj){
    Widget item;
    item = HomeListItem(obj);
    return item;
  }


  ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        needLeading: false,
        title: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 0),
                child: Image(
                  image: AssetImage("images/home/633x120.png"),
                  width: 130,
                  height: 28,
                ),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          Container(
              child: Align(
            alignment: Alignment.centerRight,
            child: FlatButton(
                onPressed: () {
                  //实现iOS切换效果，从右到左
                  //方式1 ， 全局设置为iOS平台
                  Navigator.pushNamed(context, '/login');

                  //方式2
                  /*Navigator.push( context,
                            CupertinoPageRoute(builder: (context) {
                              return Login();
                            }));*/

                  //方式3 ， 未实现（动画相关的待研究）
                  /*Navigator.push(context,
                          PageRouteBuilder(
                          transitionDuration: Duration(milliseconds:500),
                          pageBuilder: (contenxt ,animation,animation2){
                          return SlideTransition(
                              position: _offsetAnimation,
                               child: Login()
                          ) ;
                      }));*/
                },
                highlightColor: Colors.white10,
                child: Text('签到',
                    style: TextStyle(fontSize: 16, color: Color(0xffff4500)))),
          ))
        ],
      ),
      body: Container(
        child: new ListView.builder(
            padding: EdgeInsets.only(left: 0,right: 0,top: 10,bottom: 60),
            itemCount: this.dataArray.length,
            itemBuilder: (cxt, index) {
              var obj = this.dataArray[index];
              return _getItemWidget(obj);
            }),
      ),
      backgroundColor: Colors.white10,
    );
  }
}
