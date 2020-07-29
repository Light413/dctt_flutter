////////////////////////////////////////////////////////////////////////////////
// tab1_home.dart
// dctt_flutter
// lastModified 7/29/20 10:20 AM
// Created by Light413. on 2020-07-29 13:35:05
// Copyright ©2020 Light413. All rights reserved.
////////////////////////////////////////////////////////////////////////////////
import 'package:dcttflutter/common/custom_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{
    AnimationController _controller;

    Animation<Offset> _offsetAnimation;

  ///   @override
    void initState() {
      super.initState();

      _controller = AnimationController(
         duration: const Duration(seconds: 2),
         vsync: this,
       )..repeat(reverse: true);

      _offsetAnimation = Tween<Offset>(
         begin: Offset.zero,
         end: const Offset(1, 0.0),
       ).animate(CurvedAnimation(
         parent: _controller,
         curve: Curves.linear,
       ));
     }

     @override
  void dispose() {
    // TODO: implement dispose
       _controller.dispose();
    super.dispose();
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

//                  Expanded(flex: 2,child:  Container(
//                    height: 30.0,
//                    color: Colors.transparent,
//                  )),
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
                    child: Text(
                        '签到', style: TextStyle(fontSize: 16, color: Color(
                        0xffff4500)))
                ),
              )
          )
        ],),


      body: Container(
//        child: Text('HOME'),
//        color: Colors.red,
      ),

      backgroundColor: Colors.white10,
    );
  }
}