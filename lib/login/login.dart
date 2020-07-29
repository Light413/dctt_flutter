////////////////////////////////////////////////////////////////////////////////
// login.dart
// dctt_flutter
// lastModified 7/29/20 9:45 AM
// Created by Light413. on 2020-07-29 11:22:59
// Copyright ©2020 Light413. All rights reserved.
////////////////////////////////////////////////////////////////////////////////
import 'package:dcttflutter/common/custom_appbar.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget{

  void loginAction(){
    print("login action");
    print('name:' + _nameController.text);
  }

  TextEditingController _nameController =  new TextEditingController();
  TextEditingController _pwdController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  CustomAppBar(titleStr: '登录',),

      body: Container(
        padding: EdgeInsets.only(left: 20,right: 20,top: 40),
        child: Column(
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                hintText: "请输入账号",
            ),

              controller:_nameController,
              autofocus: false,
            ),

            TextFormField(
              decoration: InputDecoration(
                hintText: "请输入密码"
              ),

              controller: _pwdController,
              obscureText: true,
              autofocus: false,
            ),

            Container(
                margin: EdgeInsets.only(top: 40),
                child:  SizedBox(
                  width: 400,
                  height: 45,
                  child: RaisedButton(
                    onPressed: loginAction,
                    splashColor: Color(0xFFfcced2), //Colors.transparent,

                    child: Text("登录",
                      style: TextStyle(
                          fontSize: 20
                      ),
                    ),

                  ),
                )
            )

          ],
        ),
      ),
    );


  }
}
