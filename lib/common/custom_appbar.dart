////////////////////////////////////////////////////////////////////////////////
// custom_appbar.dart
// dctt_flutter
// lastModified 7/29/20 11:14 AM
// Created by Light413. on 2020-07-29 11:14:22
// Copyright ©2020 Light413. All rights reserved.
////////////////////////////////////////////////////////////////////////////////
import 'package:flutter/material.dart';

class CustomAppBar extends PreferredSize {
  CustomAppBar(
      {Key key,
      this.title,
      this.actions,
      this.needLeading = true,
      this.titleStr});

  final bool needLeading;
  final Widget title;
  final String titleStr;
  final List<Widget> actions;

  @override
  Size get preferredSize => Size.fromHeight(44);

  //获取title
  Widget _getTitleWidget() {
    if (this.title != null) return this.title;

    return Text(
      this.titleStr != null ? this.titleStr : null,
      style: TextStyle(fontSize: 18, color: Color(0xffff4500)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      //禁用自带返回，添加自定义返回图标
      automaticallyImplyLeading: false,
      leading: this.needLeading
          ? IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                size: 20,
                color: Color(0xffff4500),
              ),
              onPressed: () {
                Navigator.pop(context);
              })
          : null,
      title: _getTitleWidget(),
      actions: actions,
    );
  }
}
