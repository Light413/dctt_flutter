////////////////////////////////////////////////////////////////////////////////
// date_formatter.dart
// dctt_flutter
// lastModified 2020-08-06
// Created by Light413. on 2020-08-06
// Copyright ©2020 Light413. All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//日期格式化处理
class TTDateFormatter{
  ///日期字符串格式化
  ///dateTimeStr: yyyy-MM-dd HH:mm
  static String formatter(String dateTimeStr){
    DateTime time = DateTime.parse(dateTimeStr);
    DateTime now = DateTime.now();
    Duration _duration = now.difference(time);

    int value  = _duration.inMinutes;
    if(value < 1){
      return "刚刚";
    }else if(value < Duration.minutesPerHour){
      return "$value 分钟前";
    }else if(value < Duration.minutesPerDay){
      return "${_duration.inHours} 小时前";
    }else if(value < Duration.minutesPerDay * 7){
      return "${_duration.inDays} 天前";
    }

    return "${time.year}-${time.month}-${time.day}";
  }

}

