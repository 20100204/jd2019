import 'package:flutter/material.dart';

import 'package:flutter_swiper/flutter_swiper.dart';
import '../../services/screenAdaper.dart';
import '../../model/focusModel.dart';
import 'dart:convert';
import 'package:dio/dio.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List _focusData=[];
  //轮播图
  Future _getFoucsData() async {
    var dio = Dio();
    Response res = await dio.get("http://jd.itying.com/api/focus"); 
    var fm = FocusModel.fromJson(res.data); 
    setState(() {
       this._focusData = fm.result;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    _getFoucsData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenAdaper.init(context);
    return ListView(
      children: <Widget>[
        _swiperWidget(),
        SizedBox(
          height: ScreenAdaper.height(20),
        ),
        _titleWidget("猜你喜欢"),
        SizedBox(
          height: ScreenAdaper.height(20),
        ),
        _caiWidget(),
        _titleWidget("热门商品"),
        _hotWidget(),
      ],
    );
  }

  Widget _hotWidget() {
    var itemWidth = (ScreenAdaper.getScreenWidth() - 30) / 2;
    return Container(
      padding: EdgeInsets.all(10),
      child: Wrap(
        spacing: 10,
        runSpacing: 10,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(5),
            width: itemWidth,
            decoration: BoxDecoration(
                border: Border.all(
                    color: Colors.black12, width: ScreenAdaper.width(1))),
            child: Column(
              children: <Widget>[
                Container(
                    width: double.infinity,
                    child: AspectRatio(
                      aspectRatio: 1 / 1,
                      child: Image.network(
                          "https://www.itying.com/images/flutter/list1.jpg",
                          fit: BoxFit.cover),
                    )),
                Padding(
                  padding: EdgeInsets.only(top: ScreenAdaper.height(10)),
                  child: Text(
                    "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: ScreenAdaper.height(10)),
                  child: Stack(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "price",
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "price",
                          style:
                              TextStyle(decoration: TextDecoration.lineThrough),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

//踩你西黄商品
  Widget _caiWidget() {
    return Container(
      height: ScreenAdaper.height(200),
      padding: EdgeInsets.all(ScreenAdaper.width(10)),
      // width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Column(
            children: <Widget>[
              Container(
                height: ScreenAdaper.width(140),
                width: ScreenAdaper.height(140),
                margin: EdgeInsets.only(right: ScreenAdaper.width(10)),
                child: Image.network(
                  "https://www.itying.com/images/flutter/hot${index + 1}.jpg",
                  fit: BoxFit.fill,
                ),
              ),
              Text("第${index + 1}条"),
            ],
          );
        },
      ),
    );
  }

  Widget _titleWidget(v) {
    return Container(
        height: ScreenAdaper.height(32),
        margin: EdgeInsets.only(left: ScreenAdaper.width(20)),
        padding: EdgeInsets.only(left: ScreenAdaper.width(20)),
        decoration: BoxDecoration(
            border: Border(
                left: BorderSide(
                    color: Colors.red, width: ScreenAdaper.width(4)))),
        child: Text(
          v,
          style: TextStyle(color: Colors.black54),
        ));
  }

//轮播图
  Widget _swiperWidget() {
    if (this._focusData.length > 0) {
      return Container(
        child: AspectRatio(
          aspectRatio: 2 / 1,
          child: Swiper(
            pagination: SwiperPagination(),
            autoplay: true,
            //control: SwiperControl(),
            itemCount: this._focusData.length,
            itemBuilder: (BuildContext context, int index) {
              String pic = this._focusData[index].pic;
              pic = pic.replaceAll('\\', '/');
              return Image.network(
                "http://jd.itying.com/${pic}",
                fit: BoxFit.fill,
              );
            },
          ),
        ),
      );
    } else {
      return Text("加载中...");
    }

    ;
  }
}
