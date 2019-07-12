import 'package:flutter/material.dart';

import 'package:flutter_swiper/flutter_swiper.dart';
import '../../services/screenAdaper.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
          _hotWidget(),
        _titleWidget("热门商品"),
        _hotWidget(),
      ],
    );
  }

//热门商品
  Widget _hotWidget() {
    return Container(
      height: ScreenAdaper.height(200),
      padding: EdgeInsets.all(ScreenAdaper.width(10)),
      // width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Column(children: <Widget>[
            Container(
              height: ScreenAdaper.width(140),
              width:ScreenAdaper.height(140),
              margin: EdgeInsets.only(right: ScreenAdaper.width(10)),
              child: Image.network(
                "https://www.itying.com/images/flutter/hot${index+1}.jpg",
                fit: BoxFit.fill,
                ),
            ),
            Text("第${index+1}条"),
          ],);
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

  Widget _swiperWidget() {
    List<Map> imgList = [
      {"url": "https://www.itying.com/images/flutter/slide01.jpg"},
      {"url": "https://www.itying.com/images/flutter/slide02.jpg"},
      {"url": "https://www.itying.com/images/flutter/slide03.jpg"},
    ];
    return Container(
      child: AspectRatio(
        aspectRatio: 2 / 1,
        child: Swiper(
          pagination: SwiperPagination(),
          autoplay: true,
          //control: SwiperControl(),
          itemCount: 3,
          itemBuilder: (BuildContext context, int index) {
            return Image.network(
              imgList[index]["url"],
              fit: BoxFit.fill,
            );
          },
        ),
      ),
    );
    ;
  }
}
