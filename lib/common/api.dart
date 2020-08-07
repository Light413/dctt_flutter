import 'dart:convert';
import 'package:dio/dio.dart';

////////////////////////////////////////////////////////////////////////////////
// api.dart
// dctt_flutter
// lastModified 7/29/20 2:55 PM
// Created by Light413. on 2020-07-29 14:55:20
// Copyright ©2020 Light413. All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//api接口定义
const BASE_URL = 'http://39.106.164.101:80/tt/';
const get_sy_url = 'getPostList.php'; //首页列表
const publish_url = "publish.php";//发布动态
const comment_url = "comment.php";//评论
const detail_url = "detail.php";//动态详情
const update_profile_url = "updateProfile.php";//更新用户信息
const homepage_url = "getsc.php";//个人主页、个人收藏
const fans_url = "fan.php"; //粉丝关注
const blackList_url = "blackList.php";//黑名单
const delete_sc_url = "deletesc.php";//删除动态，删除收藏
const sh_url = "sh.php";
const daren_url = "darenList.php";

const sy_getSysMsg = 'sy/getSysMsg.php';//获取系统系统消息
const sy_getAllCnt = 'sy/getPostCnt.php';//获取帖子总数/浏览计数

//登录注册
const login_url= "login.php";
const register_url = "register.php";
const get_checkcode_url = 'sendCheckCode.php';//获取验证码

const get_msglist_url = "message.php";
const jubao_url = "jubao.php";
const feedback_url = "feedback.php";
const check_version_url = 'checkUpdate.php';

//html
const publish_note_url = 'p/publishNotes.html';//发布须知
const user_agreement_url = "p/userAgreement.html";
const aboutus_url = "p/aboutus.html";
const contactus_url = "p/contactus.html";
const disclaimer_url = "p/disclaimer.html";
const usehelp_url = "p/usehelp.html";
const privacy_agreement_url = "p/userPrivacy.html";
const feedbackList_url = "p/feedbackList.html";
const joinus_url = "p/joinus.html";

///接口请求操作
void httpRequest(String httpMethod, String path,{Map<String, dynamic>option,  Function successCallBack, Function errorCallBack})
{
  Future<Response> _request(String path , {Map option,String method = 'get'}) async {
    var cf = BaseOptions(
      baseUrl: BASE_URL,
      contentType: Headers.formUrlEncodedContentType,
      connectTimeout: 60000,//超时60s
      receiveTimeout: 60000
    );

    var url =  path;
    var dio = new Dio(cf);
    /*//charlessproxy抓包设置代理
  (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (client) {
    // config the http client
    client.findProxy = (uri) {
      //proxy all request to localhost:8888
      return "PROXY 172.20.145.20:8888"; //这里将localhost设置为自己电脑的IP，其他不变，注意上线的时候一定记得把代理去掉
    };
    // you can also create a HttpClient to dio
    // return HttpClient();
  };
  */

    var response;
    if(method == "get"){
      response  = await dio.get(url,queryParameters: option);
    }else{
      response  = await dio.post(url,data: option);
    }

    return response;
  }

  _request(path, option: option , method: httpMethod).then((value) {
    print('$path-------ok');
    Map obj = JsonDecoder().convert(value.toString());
    if(obj['status'] == 200 && successCallBack != null){
      successCallBack(obj['body']);
    }else{
      if(errorCallBack != null){
        errorCallBack(obj['msg'] ?? "服务器返回错误");
      }
    }
  }).catchError((err) {
    var errStr = err.toString() ?? "服务器返回错误";
    print("!!!!!!!!!!!-" + errStr);
    errorCallBack(errStr);
  }).whenComplete(() {
    //print("本次请求执行完成");
  });
}

///GET方法请求
void apiGetRequest(String path,{Map<String, dynamic>option,  Function successCallBack, Function errorCallBack}){
  httpRequest('get', path , option: option,successCallBack: successCallBack,errorCallBack: errorCallBack);
}
///POST方法请求
void apiPostRequest(String path,{Map<String, dynamic>option,  Function successCallBack, Function errorCallBack}){
  httpRequest('post', path , option: option,successCallBack: successCallBack,errorCallBack: errorCallBack);
}