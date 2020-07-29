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
