////////////////////////////////////////////////////////////////////////////////
// main.dart
// dctt_flutter
// lastModified 7/29/20 1:24 PM
// Created by Light413. on 2020-07-29 13:41:29
// Copyright ©2020 Light413. All rights reserved.
////////////////////////////////////////////////////////////////////////////////
import 'dart:io';
import 'package:dcttflutter/common/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'common/iconfont.dart';
import 'login/login.dart';
import 'tab/tab1_home.dart';
import 'tab/tab2_community.dart';
import 'tab/tab3_publish.dart';
import 'tab/tab4_life.dart';
import 'tab/tab5_me.dart';


void main() {
  runApp(MyApp());
  if (Platform.isAndroid) {
    // 以下两行 设置android状态栏为透明的沉浸。写在组件渲染之后，是为了在渲染后进行set赋值，覆盖状态栏，写在渲染之前MaterialApp组件会覆盖掉这个值。
    SystemUiOverlayStyle systemUiOverlayStyle =
        SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '郸城头条',
      theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
          primaryColor: Color(0xfff5f5f5),
          platform: TargetPlatform.iOS),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      routes: {'/login': (BuildContext context) => Login()},
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  void _tapAction(index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<BottomNavigationBarItem> _barItem = [
      BottomNavigationBarItem(
          icon: Icon(TTFont.tabHomeIcon), title: Text('首页')),
      BottomNavigationBarItem(
          icon: Icon(TTFont.tabThemeIcon), title: Text('社区')),
      BottomNavigationBarItem(
        icon: Icon(
          TTFont.tabPublishIcon,
          color: Color(0xffff4500),
          size: 22,
        ),
        title: Text(
          '发布',
          style: TextStyle(color: tt_theme_color),
        ),
      ),
      BottomNavigationBarItem(
          icon: Icon(TTFont.tabListIcon), title: Text('生活')),
      BottomNavigationBarItem(icon: Icon(TTFont.tabMeIcon), title: Text('我的'))
    ];

    List<Widget> _pageList = [

      Theme(data: ThemeData(primaryColor: Color(0xfff5f5f5)), child: HomePage()),
      Community(),

      Theme(
          data: ThemeData(primaryColor: tt_theme_color, visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          child: Publish()
      ),

      Theme(data: ThemeData(primaryColor: tt_theme_color), child: Life()),
      Theme(data: ThemeData(primaryColor: tt_theme_color), child: Me())
    ];

    return Scaffold(
      body: _pageList[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: _barItem,
        iconSize: 22,
        currentIndex: _currentIndex,
        onTap: _tapAction,
        fixedColor: Color.fromARGB(255, 68, 68, 68),
        unselectedItemColor: Color(0xff929292),
        selectedFontSize: 11,
        unselectedFontSize: 11,
        type: BottomNavigationBarType.fixed,
      ),

      /*floatingActionButton: FloatingActionButton(
      onPressed: (){},
      child: Icon(Icons.add),
//      tooltip: '发布',
    ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,*/
    );
  }
}
