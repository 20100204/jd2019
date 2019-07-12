import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScreenAdaper{
  static init(context){
    ScreenUtil.instance = ScreenUtil(width: 750,height: 1334)..init(context);
  }
  static height(double v){
    return ScreenUtil.getInstance().setHeight(v);
  }
  //设置宽度
  static width(double v){
    return ScreenUtil.getInstance().setWidth(v);
  }
  //获取宽度
  static getScreenWidth(){
    return ScreenUtil.screenWidthDp;
  }

  static getScreenHeight(){
    return ScreenUtil.screenHeightDp;
  }

}

